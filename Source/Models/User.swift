//
//  User.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/19/21.
//

import Foundation


class User: NSObject {
    
    var slug: String?
    var username: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var phoneNumber: String?
    var heroSlugs: [String] = []
    var heroes: [HeroModel] = []
    var DOB: String?
    var isAdmin: Bool = false
    var profile_image_name: String?
    var party: [String] = []
    var notes: [NoteModel] = []
    
    func createDictForValues() -> [String: Any] {
        var valueDict = [String: Any]()
        valueDict["slug"] = self.slug
        valueDict["firstName"] = self.firstName
        valueDict["lastName"] = self.lastName
        valueDict["email"] = self.email
        valueDict["phoneNumber"] = self.phoneNumber
        valueDict["heroSlugs"] = self.heroSlugs
        valueDict["isAdmin"] = self.isAdmin
        valueDict["profile_image_name"] = self.profile_image_name
        valueDict["party"] = self.party
        valueDict["username"] = self.username
        var noteArray = [[String: Any]]()
        for note in self.notes {
            noteArray.append(note.createDictForValues())
        }
        valueDict["notes"] = noteArray
        
        var heroArray = [[String: Any]]()
        for hero in self.heroes {
            heroArray.append(hero.createDictForValues())
        }
        valueDict["heroes"] = heroArray
        
        
        return valueDict
    }
    
    func generateModelFromDict(data: [String: Any], slug: String?) -> User {
        var newUser = User()
        newUser.slug = slug
        newUser.firstName = data["firstName"] as? String
        newUser.lastName = data["lastName"] as? String
        newUser.email = data["email"] as? String
        newUser.phoneNumber = data["phoneNumber"] as? String
        newUser.isAdmin = data["isAdmin"] as? Bool ?? false
        newUser.heroSlugs = data["heroSlugs"] as? [String] ?? []
        newUser.party = data["party"] as? [String] ?? []
        newUser.profile_image_name = data["profile_image_name"] as? String
        newUser.username = data["username"] as? String
        return newUser
    }
    
}


class NoteModel: NSObject {
    var note: String?
    var created_ts: String?
    var last_updated_ts: String?
    var author_slug: String?
    var mission_slug: String?
    
    func createDictForValues() -> [String: Any] {
        var valueDict = [String: Any]()
        valueDict["note"] = self.note
        valueDict["created_ts"] = self.created_ts
        valueDict["last_updated_ts"] = self.last_updated_ts
        valueDict["author_slug"] = self.author_slug
        valueDict["mission_slug"] = self.mission_slug
        return valueDict
    }
    
    func generateModelFromDict(dict: [String: Any]) -> NoteModel {
        var newNote = NoteModel()
        newNote.note = dict["note"] as? String
        newNote.created_ts = dict["created_ts"] as? String
        newNote.last_updated_ts = dict["last_updated_ts"] as? String
        newNote.author_slug = dict["author_slug"] as? String
        newNote.mission_slug = dict["mission_slug"] as? String
        return newNote
    }
    
    
}

