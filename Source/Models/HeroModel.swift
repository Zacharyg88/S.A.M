//
//  HeroModel.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/19/21.
//

import Foundation


class HeroModel: NSObject {
    
    var slug: String?
    var isCurrentHero: Bool = false
    var firstName: String?
    var lastName: String?
    var imageName: String?
    var concept: String?
    var race: String?
    var backstory: String?
    var skills: [SkillModel] = []
    var gold: Int?
    var items: [NSObject] = []
    var powers: [PowerModel] = []
    var powerPoints: Int?
    var attributes: [AttributeModel] = []
    var edges: [EdgeModel] = []
    var hinderances: [HindranceModel] = []
    var physicalDescription: String?
    var pace: Int?
    var size: Int?
    var bennies: Int?
    var parry: Int {
        get {
            return 2 + ((self.getSkillByName(name: "Fighting").dice?.sides ?? 0) / 2)
        }
    }
    var toughness: Int {
        get {
            return (self.getAreaArmorTotal(area: "Torso") + (2 + ((self.attributes[4].dice?.sides ?? 0) / 2)) + self.getModifierForTrait(title: "vigor"))
        }
    }
    
    
    func getModifierForTrait(title: String) -> Int {
        var modTotal = 0
        
        for edge in self.edges {
            let mod = edge.modifier
            if mod?.attribute == title {
                if mod?.isPositive ?? false {
                    modTotal += mod?.modInt ?? 0
                }else {
                    modTotal -= mod?.modInt ?? 0
                }
            }
        }
        
        return modTotal
    }
    
    func getAreaArmorTotal(area: String) -> Int {
        var armorTotal: Int = 0
        var highestArmor: Int = 0
        for item in self.items {
            if let armor = item as? ArmorModel, armor.areasProtected.contains(area) {
                    if (armor.armorRating ?? 0) > highestArmor {
                        armorTotal -= (highestArmor / 2)
                        highestArmor = armor.armorRating ?? 0
                        armorTotal += armor.armorRating ?? 0
                    }else {
                        armorTotal += ((armor.armorRating ?? 0) / 2)
                    }

            }
        }
        return armorTotal
    }
    
    func getSkillByName(name: String) -> SkillModel {
        for skill in self.skills {
            if skill.title == name {
                return skill
            }
        }
        return SkillModel()
    }
    
    func createDictForValues() -> [String: Any] {
        var valueDict: [String: Any] = [:]
        valueDict["isCurrentHero"] = self.isCurrentHero
        valueDict["firstName"] = self.firstName
        valueDict["lastName"] = self.lastName
        valueDict["imageName"] = self.imageName
        valueDict["race"] = self.race
        valueDict["concept"] = self.concept
        valueDict["backstory"] = self.backstory
        valueDict["gold"] = self.gold
        valueDict["powerPoints"] = self.powerPoints
        var skillsDictArray: [[String: Any]] = [[:]]
        for skill in self.skills {
            //run skills dict func here
            skillsDictArray.append(skill.generateDictForValues())
        }
        valueDict["skills"] = skillsDictArray
        
        var itemsDictArray: [[String: Any]] = [[:]]
        for item in items {
            //run item dict func here
            if let weaponItem = item as? WeaponModel {
                itemsDictArray.append(weaponItem.generateDictForValues())
            }
            if let armorItem = item as? ArmorModel {
                itemsDictArray.append(armorItem.generateDictForValues())
            }
            if let shieldItem = item as? ShieldModel {
                itemsDictArray.append(shieldItem.generateDictForValues())
            }
            if let vehicleItem = item as? VehicleModel{
                itemsDictArray.append(vehicleItem.generateDictForValues())
            }
            if let itemItem = item as? ItemModel {
                itemsDictArray.append(itemItem.generateDictForValues())
            }
        }
        valueDict["items"] = itemsDictArray
        
        var powersDictArrary: [[String: Any]] = [[:]]
        for power in self.powers {
            // run powers dict func here
            powersDictArrary.append(power.generateDictForValues())
        }
        valueDict["powers"] = powersDictArrary
        
        var attributesDictArray: [[String: Any]] = [[:]]
        for attribute in self.attributes {
            //run attributes dict func here
            attributesDictArray.append(attribute.generateDictForValues())
        }
        valueDict["attributes"] = attributesDictArray
        
        var edgesDictArray: [[String: Any]] = [[:]]
        for edge in self.edges {
            // run edges dict func here
            edgesDictArray.append(edge.generateDictForValues())
        }
        valueDict["edges"] = edgesDictArray
        
        var hinderancesDictArray: [[String: Any]] = [[:]]
        for hinderance in hinderances {
            //run hindrance dict func here
            hinderancesDictArray.append(hinderance.generateDictForValues())
        }
        valueDict["hinderances"] = hinderancesDictArray
        
        valueDict["physicalDescription"] = self.physicalDescription
        valueDict["pace"] = self.pace
        valueDict["size"] = self.size
        valueDict["bennies"] = self.bennies
        return valueDict
    }
    
    
    func createObjectFromDict(data: [String: Any], slug: String) -> HeroModel {
        var newHero = HeroModel()
        newHero.slug = slug
        newHero.isCurrentHero = data["isCurrentHero"] as? Bool ?? false
        newHero.gold = data["gold"] as? Int
        newHero.powerPoints = data["powerPoints"] as? Int
        newHero.firstName = data["firstName"] as? String
        newHero.race = data["race"] as? String
        newHero.lastName = data["lastName"] as? String
        newHero.imageName = data["imageName"] as? String
        newHero.concept = data["concept"] as? String
        newHero.backstory = data["backstory"] as? String
        if let skillsDictArray = data["skills"] as? [[String: Any]] {
            var skillsArray: [SkillModel] = []
            for skill in skillsDictArray {
                skillsArray.append(SkillModel().generateModelFromDict(data: skill))
            }
            newHero.skills = skillsArray
        }
        if let itemsDictArray: [[String:  Any]] = data["items"] as? [[String: Any]] {
            var itemsArray: [NSObject] = []
            for itemDict in itemsDictArray {
                if itemDict["classification"] != nil {
                    // item is a Weapon'
                    itemsArray.append(WeaponModel().generateModelFromDict(data: itemDict))
                }else
                if itemDict["armorRating"] != nil {
                    // item is Armor
                    itemsArray.append(ArmorModel().generateModelFromDict(data: itemDict))
                }else
                if itemDict["parry"] != nil {
                    // item is Shield
                    itemsArray.append(ShieldModel().generateModelFromDict(data: itemDict))
                }else
                if itemDict["requiredCrew"] != nil {
                    // item is Vehicle
                    itemsArray.append(VehicleModel().generateModelFromDict(data: itemDict))
                }else {
                    //item is un-categorized Item
                    itemsArray.append(ItemModel().generateModelFromDict(data: itemDict))
                }
            }
            newHero.items = itemsArray
        }
        
        if let powersDictArray: [[String: Any]] = data["powers"] as? [[String: Any]] {
            var powersArray: [PowerModel] = []
            for powerDict in powersDictArray {
                powersArray.append(PowerModel().generateModelFromDict(data: powerDict))
            }
            newHero.powers = powersArray
        }
        
        if let attributesDictArray: [[String: Any]] = data["attributes"] as? [[String: Any]] {
            var attributesArray: [AttributeModel] = []
            for attributeDict in attributesDictArray {
                attributesArray.append(AttributeModel().generateModelFromDict(data: attributeDict))
            }
            newHero.attributes = attributesArray
        }
        
        if let edgesDictArray: [[String: Any]] = data["edges"] as? [[String: Any]] {
            var edgesArray: [EdgeModel] = []
            for edgeDict in edgesDictArray {
                edgesArray.append(EdgeModel().generateModelFromDict(data: edgeDict))
            }
            newHero.edges = edgesArray
        }
        
        if let hinderanceDictArray: [[String: Any]] = data["hinderances"] as? [[String: Any]] {
            var hinderanceArray: [HindranceModel] = []
            for hinderanceDict in hinderanceDictArray {
                hinderanceArray.append(HindranceModel().generateModelFromDict(data: hinderanceDict))
            }
            newHero.hinderances = hinderanceArray
        }
        
        newHero.physicalDescription = data["physicalDescription"] as? String
        newHero.pace = data["pace"] as? Int
        newHero.size = data["size"] as? Int
        newHero.bennies = data["bennies"] as? Int
        return newHero
    }
}


