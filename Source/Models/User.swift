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
    var DOB: String?
    var isAdmin: Bool = false
    var profile_image_name: String?
    var party: [String] = []
    
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

