//
//  User.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/19/21.
//

import Foundation


class User: NSObject {
    
    var slug: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var phoneNumber: String?
    var heroSlugs: [String] = []
    var isAdmin: Bool = false

    required public init(slug: String?, firstName: String?, lastName: String?, email: String?, phoneNumber: String?, isAdmin: Bool) {
        self.slug = slug
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.isAdmin = isAdmin
    }
    
    func createDictForValues() -> [String: Any] {
        var valueDict = [String: Any]()
        valueDict["slug"] = self.slug
        valueDict["firstName"] = self.firstName
        valueDict["lastName"] = self.lastName
        valueDict["email"] = self.email
        valueDict["phoneNumber"] = self.phoneNumber
        valueDict["heroSlugs"] = self.heroSlugs
        valueDict["isAdmin"] = self.isAdmin
        return valueDict
    }
    
    func generateModelFromDict(data: [String: Any], slug: String?) -> User {
        var newUser = User(slug: slug,
                           firstName: data["firstName"] as? String,
                           lastName: data["lastName"] as? String,
                           email: data["email"] as? String,
                           phoneNumber: data["phoneNumber"] as? String,
                           isAdmin: data["isAdmin"] as? Bool ?? false)
        newUser.heroSlugs = data["heroSlugs"] as? [String] ?? []
        return newUser
    }
    
}

