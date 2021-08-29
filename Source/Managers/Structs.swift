//
//  Structs.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/20/21.
//

import Foundation
import UIKit


var colors = Colors()
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

struct Colors {
    
    var lightRed        = UIColor(hexString: "913C50")
    var blue            = UIColor(hexString: "14646D")
    var lightBlue       = UIColor(hexString: "229AA8")
    var green           = UIColor(hexString: "265E58")
    var lightGreen      = UIColor(hexString: "34AD89")
    var powerColor      = UIColor(hexString: "8142B2")
    var powersLight     = UIColor(hexString: "BE6BFF")
    var planetDry       = UIColor(hexString: "826D2D")
    var planetCore      = UIColor(hexString: "384523")
    var belt            = UIColor(hexString: "243840")
    var backing         = UIColor(hexString: "283E46")
    var agilityColor    = UIColor(hexString: "339B7B")
    var spiritColor     = UIColor(hexString: "29A0D3")
    var smartsColor     = UIColor(hexString: "8470A4")
    var strengthColor   = UIColor(hexString: "CED2D3")
    var vigorColor      = UIColor(hexString: "")
    var highlightColor  = UIColor(hexString: "537681")
    var buttonBorder    = UIColor(hexString: "FFFFFF").withAlphaComponent(0.32)
    var buttonBackground    = UIColor(hexString: "061316").withAlphaComponent(0.8)
    var backgroundColor     = UIColor(hexString: "0B1A1F")
    var shakenColor         = UIColor(hexString: "9B7730")
    var subheaderColor      = UIColor(hexString: "FFFFFF").withAlphaComponent(0.6)
    
}
