//
//  Structs.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/20/21.
//

import Foundation



struct DatabaseKeys {
    
    
    //User
    var slug =                  "slug"
    var title =                 "title"
    var firstName =             "firstName"
    var lastName =              "lastName"
    var email =                 "email"
    var phoneNumber =           "phoneNumber"
    var heroSlugs =             "heroSlugs"
    var isAdmin =               "isAdmin"
    
    
    //Hero
    var imageName =             "imageName"
    var concept =               "concept"
    var backstory =             "backstory"
    var skillSlugs =            "skillSlugs"
    var itemSlugs =             "itemSlugs"
    var powerSlugs =            "powerSlugs"
    var attributeSlugs =        "attributeSlugs"
    var edgeSlugs =             "edgeSlugs"
    var physicalDescription =   "physicalDescription"
    var pace =                  "pace"
    var size =                  "size"
    var bennies =               "bennies"
    var parry =                 "parry"
    var toughness =             "toughness"
    
    //Items
    var cost =                  "cost"
    var notes =                 "notes"
    var classification =        "classification"
    var ammoCap =               "ammoCap"
    var damageString =          "dammageString"
    var range =                 "range"
    var ap =                    "ap"
    var rof =                   "rof"
    var shots =                 "shots"
    var minStrength =           "minStrength"
    var weight =                "weight"
    var armorRating =           "armorRating"
    var areasProtected =        "areasProtected"
    var cover =                 "cover"
    var handling =              "handling"
    var topSpeed =              "topSpeed"
    var toughnessMod =          "toughnessMod"
    var requiredCrew =          "requiredCrew"
    var additionalCrew =        "additionalCrew"
    var totalCapacity =         "totalCapacity"
    var rank =                  "rank"
    var powerPoints =           "powerPoints"
    var duration =              "duration"
    
    //Dice
    var sides =                 "sides"
    
    //Mechanics
    var attribute =             "attribute"
    var dice =                  "dice"
    var requiredExperience =    "requiredExperience"
    var requiredSkillName =     "requiredSkillName"
    var requiredSkillLevel =    "requiredSkillLevel"
    var summary =               "summary"
    var modifier =              "modifier"
    var isPositive =            "isPositive"
    var modInt =                "modInt"
    var skill =                 "skill"
    
}


enum CodingKeys: String, CodingKey {
    case response =             "response"
    //User
    case slug =                  "slug"
    case title =                 "title"
    case firstName =             "firstName"
    case lastName =              "lastName"
    case email =                 "email"
    case phoneNumber =           "phoneNumber"
    case heros =                 "heros"
    case isAdmin =               "isAdmin"
    
    
    //Hero
    case imageName =             "imageName"
    case concept =               "concept"
    case backstory =             "backstory"
    case skills =                "skills"
    case items =                 "items"
    case powers =                "powers"
    case attributes =            "attributes"
    case edges =                 "edges"
    case physicalDescription =   "physicalDescription"
    case pace =                  "pace"
    case size =                  "size"
    case bennies =               "bennies"
    case parry =                 "parry"
    case toughness =             "toughness"
    
    //Items
    case cost =                  "cost"
    case notes =                 "notes"
    case classification =        "classification"
    case ammoCap =               "ammoCap"
    case damageString =          "dammageString"
    case range =                 "range"
    case ap =                    "ap"
    case rof =                   "rof"
    case shots =                 "shots"
    case minStrength =           "minStrength"
    case weight =                "weight"
    case armorRating =           "armorRating"
    case areasProtected =        "areasProtected"
    case cover =                 "cover"
    case handling =              "handling"
    case topSpeed =              "topSpeed"
    case toughnessMod =          "toughnessMod"
    case requiredCrew =          "requiredCrew"
    case additionalPassengers =  "additionalPassengers"
    case totalCapacity =         "totalCapacity"
    case rank =                  "rank"
    case powerPoints =           "powerPoints"
    case duration =              "duration"
    
    //Dice
    case sides =                 "sides"
    
    //Mechanics
    case attribute =             "attribute"
    case dice =                  "dice"
    case requiredExperience =    "requiredExperience"
    case requiredSkillName =     "requiredSkillName"
    case requiredSkillLevel =    "requiredSkillLevel"
    case summary =               "summary"
    case modifier =              "modifier"
    case isPositive =            "isPositive"
    case modInt =                "modInt"
    case skill =                 "skill"
}
