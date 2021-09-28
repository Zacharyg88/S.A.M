//
//  DatabaseManager.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/20/21.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage


var databaseManager = DatabaseManager()
var userManager = UserManager()
var dbKeys = DatabaseKeys()
class DatabaseManager: NSObject {
    
    var database = Firestore.firestore()
    var storage = Storage.storage()
    //User Functions
    func authenticateUser(email: String, password: String, _ completion: @escaping (_ user: User?, _ error: Error?) -> Void ) {
        Auth.auth().createUser(withEmail: email, password: password) { (data, error) in
            if error != nil {
                completion(nil, error)
            }else {
                //Map Data to new User object and add it to User Table in Database
                var newUser: User = User(slug: data?.user.uid, firstName: nil, lastName: nil, email: data?.user.email, phoneNumber: nil, isAdmin: false)
                userManager.currentUser = newUser
                self.updateUserInDataBase(user: newUser) { (success, error) in
                    if success {
                        completion(newUser, nil)
                    }else {
                        completion(nil, error)
                    }
                }
                
            }
        }
    }
    
    func signInUser(email: String, password: String, _ completion: @escaping (_ success: Bool, _ error: Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error)
                completion(false, error)
            }else {
                let documentReference = self.database.collection("users").document(result?.user.uid ?? "")
                documentReference.getDocument { (document, error) in
                    if let doc = document, doc.exists {
                        let currentUser: User = User(slug: doc.documentID, firstName: doc["firstName"] as? String ?? "", lastName: doc["lastName"] as? String ?? "", email: doc["email"] as? String ?? "", phoneNumber: doc["phoneNumber"] as? String ?? "", isAdmin: doc["isAdmin"] as! Bool? ?? false)
                        currentUser.heroSlugs = doc["heroSlugs"] as? [String] ?? [String]()
                        userManager.currentUser = currentUser
                        completion(true, nil)
                        
                    }
                }
            }
        }
    }
    
    func getUserFromDatabase(slug: String, completion: @escaping (_ user: User?) -> Void) {
        var user: User?
        let userRef = database.collection("users").document(slug)
        userRef.getDocument { (document, error) in
            if let doc = document, doc.exists {
                let slug: String = document?.documentID ?? ""
                let firstName: String = (doc["firstName"]) as? String ?? ""
                let lastName: String = (doc["lastName"]) as? String ?? ""
                let email: String = (doc["email"]) as? String ?? ""
                let phoneNumber: String = (doc["phoneNumber"]) as? String ?? ""
                let isAdmin: Bool = doc["isAdmin"] as? Bool ?? false
                let currentUser: User = User(slug: slug, firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, isAdmin: isAdmin)
                currentUser.heroSlugs = doc["heroSlugs"] as? [String] ?? [String]()
                userManager.currentUser = currentUser
                completion(currentUser)
            }else {
                completion(nil)
            }
        }
    }
    
    
    func updateUserInDataBase(user: User, _ completion: @escaping(_ success: Bool, _ error: Error?) -> Void) {
        database.collection("users").document(user.slug!).setData([
            dbKeys.firstName : user.firstName,
            dbKeys.lastName : user.lastName,
            dbKeys.email: user.email,
            dbKeys.phoneNumber: user.phoneNumber,
            "heroSlugs": user.heroSlugs,
            dbKeys.isAdmin: user.isAdmin
        ], merge: true) { err in
            if err != nil {
                completion(false, err)
            }else {
                completion(true, nil)
            }
        }
    }
    
    
    //Storage Requests
    func getImageFromStorage(imageName: String, completion: @escaping (_ image: UIImage?, _ error: Error?) -> Void) {
        let storeRef = storage.reference()
        let imageRef = storeRef.child(imageName)
        imageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            if error != nil {
                completion(nil, error)
            }else {
                completion(UIImage(data: data ?? Data()), nil)
            }
        }
    }
    
    func postImageToStorage(image: UIImage, imageLocation: String, completion: @escaping(_ success: Bool, _ error: Error?) -> Void) {
        let storeRef = storage.reference()
        let imageRef = storeRef.child(imageLocation)
        let data = image.jpegData(compressionQuality: 0.75)
        let uploadTask = imageRef.putData(data ?? Data(), metadata: nil) { (metadata, error) in
            print(metadata, error)
            
        }
        
        
    }
    
    
    
    //Gear Requests
    func getGearShopFromDatabase(completion: @escaping (_ shop: GearShopModel?, _ error: Error?) -> Void) {
        var gearShopRef = database.collection("gear_shops")
        gearShopRef.getDocuments { snapshot, error in
            if error != nil {
                print("There was an error getting the gear shop \(error)")
                completion(nil, error)
            }else {
                for document in snapshot?.documents ?? [QueryDocumentSnapshot]() {
                    if let doc: QueryDocumentSnapshot = document as? QueryDocumentSnapshot, doc.exists {
                        completion(GearShopModel().generageObjectFromDict(dict: doc.data()), nil)
                    }
                }
            }
        }
    }
    
    
    //Mission Requests
    func getAllMissionsFromDatabase(completion: @escaping (_ missions: [MissionModel]?, _ error: Error?) -> Void) {
        var missionArray: [MissionModel] = []
        let missionRef = database.collection("missions")
        missionRef.getDocuments { (snapshot, error) in
            for document in snapshot?.documents ?? [QueryDocumentSnapshot]() {
                if let doc: QueryDocumentSnapshot = document as? QueryDocumentSnapshot, doc.exists {
                    missionArray.append(MissionModel().generateModelFromDict(data: doc.data(), slug: doc.documentID))
                }
            }
            if error != nil {
                completion(nil, error)
            }else {
                completion(missionArray, nil)
            }
        }
    }
    
    func postMissionVote(mission: MissionModel, completion: @escaping (_ success: Bool, _ error: Error?) -> Void) {
        var missionRef = database.collection("missions").document(mission.slug ?? "")
        missionRef.updateData(["votes": mission.votes])
    }
    
    // Hero Requests
    func getHeroFromSlug(slug: String, completion: @escaping (_ hero: HeroModel?, _ error: Error?)-> Void) {
        let heroRef = database.collection("heroes").document(slug)
        heroRef.getDocument { (snapshot, error) in
            if error != nil {
                print("There was an error getting the Hero from the databsse")
                completion(nil, error)
            }else {
                let heroObject: HeroModel = HeroModel().createObjectFromDict(data: snapshot?.data() as! [String: Any], slug: snapshot?.documentID ?? "")
                completion(heroObject, nil)
            }
        }
    }
    
    func postHeroToDatabase(hero: HeroModel, image: UIImage?, completion: @escaping (_ success: Bool, _ error: Error?) -> Void) {
        let heroesRef = database.collection("heroes").document()
        let id = heroesRef.documentID
        if image != nil {
            hero.imageName = "Images/hero_\(id)"
            self.postImageToStorage(image: image ?? UIImage(), imageLocation: hero.imageName ?? "") { success, error in
                print(success, error)
            }
        }
        
        heroesRef.setData(hero.createDictForValues(), merge: true) { (error) in
            if error != nil {
                completion(false, error)
            }else {
                userManager.currentUser?.heroSlugs.append(id)
                self.updateUserInDataBase(user: userManager.currentUser!) { (success, error) in
                    if error != nil {
                        completion(true, error)
                    }else {
                        completion(true, nil)
                    }
                }
            }
        }
    }
    
    
    //Mechanics Requests
    func postSkillToDatabase(skill: SkillModel, completion: @escaping (_ success: Bool, _ error: Error?) -> Void) {
        let skillRef = database.collection("skills")
        skillRef.addDocument(data: skill.generateDictForValues()
        ) { err in
            if err != nil {
                completion(false, err)
            }else {
                completion(true, nil)
            }
        }
    }
    
    func getSkillsFromDatabase(completion: @escaping (_ skills: [SkillModel]?, _ error: Error?)->  Void) {
        var skillArray: [SkillModel] = []
        let skillRef = database.collection("skills")
        skillRef.getDocuments { (snapshot, error) in
            if error != nil {
                print("there was an error \(error)")
                completion(nil, error)
            }else {
                for document in snapshot?.documents ?? [QueryDocumentSnapshot]() {
                    if let doc: QueryDocumentSnapshot = document as? QueryDocumentSnapshot, doc.exists {
                        skillArray.append(SkillModel().generateModelFromDict(data: doc.data()))
                    }
                }
                completion(skillArray, nil)
            }
        }
    }
    
    
    func postRulebookToServer(rulebook: RulebookModel, completion: @escaping (_ success: Bool, _ error: Error?) -> Void) {
        let rulebookRef = database.collection("rulebooks")
        rulebookRef.addDocument(data: rulebook.generateDictFromModel()) { err in
            if err != nil {
                completion(false, err)
            }else {
                completion(true, nil)
            }
        }
    }
    
    func getRulebooksFromServer(completion: @escaping(_ rulebooks: [RulebookModel], _ error: Error?) -> Void) {
        var rulebookArray: [RulebookModel] = []
        let rulebookRef = database.collection("rulebooks")
        rulebookRef.getDocuments { (snapshot, error) in
            if error != nil {
                completion(rulebookArray, error)
            }else {
                for document in snapshot?.documents ?? [QueryDocumentSnapshot]() {
                    if let doc: QueryDocumentSnapshot = document as? QueryDocumentSnapshot, doc.exists {
                        var newRulebook = RulebookModel().generateObjectFromDict(dict: doc.data())
                        newRulebook.slug = doc.documentID
                        rulebookArray.append(newRulebook)
                    }
                }
                completion(rulebookArray, nil)
            }
            
        }
    }
    
    
}


class UserManager: NSObject {
    
    var currentUser: User? {
        didSet {
            UserDefaults.standard.setValue(currentUser?.slug, forKey: "CurrentUserSlug")
        }
    }
}
