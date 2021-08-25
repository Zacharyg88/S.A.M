//
//  ItemModels.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/19/21.
//

import Foundation



class ItemModel: NSObject {
    var title: String?
    var cost: Int?
    var notes: String?

    
    func generateDictForValues() -> [String: Any] {
        var valuesDict: [String: Any] = [:]
        valuesDict["title"] = self.title
        valuesDict["cost"] = self.cost
        valuesDict["notes"] = self.notes
        return valuesDict
    }
    
    func generateModelFromDict(data: [String: Any]) -> ItemModel {
        var newItem = ItemModel()
        
        newItem.title = data["title"] as? String
        newItem.cost = data["cost"] as? Int
        newItem.notes = data["notes"] as? String
        
        return newItem
    }
}

class WeaponModel: NSObject {
    var title: String?
    var cost: Int?
    var notes: String?
    var classification: String?
    var ammoCap: Int?
    var damageString: String?
    var range: String?
    var ap: Int?
    var rof: Int?
    var shots: Int?
    var minStrength: Int?
    var weight: Int?
    
    func generateDictForValues() -> [String: Any] {
        var valuesDict: [String: Any] = [:]
        valuesDict["title"] = self.title
        valuesDict["cost"] = self.title
        valuesDict["notes"] = self.notes
        valuesDict["classification"] = self.classification
        valuesDict["ammoCap"] = self.ammoCap
        valuesDict["damageString"] = self.damageString
        valuesDict["range"] = self.range
        valuesDict["ap"] = self.ap
        valuesDict["rof"] = self.rof
        valuesDict["shots"] = self.shots
        valuesDict["minStrength"] = self.minStrength
        valuesDict["weight"] = self.weight
        return valuesDict
    }
    
    func generateModelFromDict(data: [String: Any]) -> WeaponModel {
        var newWeapon = WeaponModel()
        
        newWeapon.title = data["title"] as? String
        newWeapon.cost = data["cost"] as? Int
        newWeapon.notes = data["notes"] as? String
        newWeapon.classification = data["classification"] as? String
        newWeapon.ammoCap = data["ammoCap"] as? Int
        newWeapon.damageString = data["damageString"] as? String
        newWeapon.range = data["range"] as? String
        newWeapon.ap = data["ap"] as? Int
        newWeapon.rof = data["rof"] as? Int
        newWeapon.shots = data["shots"] as? Int
        newWeapon.minStrength = data["minStrength"] as? Int
        newWeapon.weight = data["weight"] as? Int
        
        
        return newWeapon
        
    }
    
}


class ArmorModel: NSObject {
    var title: String?
    var cost: Int?
    var notes: String?
    var armorRating: Int?
    var minStrength: Int?
    var areasProtected: [String] = []
    var weight: Int?
    
    func generateDictForValues() -> [String: Any] {
        var valuesDict: [String: Any] = [:]
        valuesDict["title"] = self.title
        valuesDict["cost"] = self.title
        valuesDict["notes"] = self.notes
        valuesDict["armorRating"] = self.armorRating
        valuesDict["minStrength"] = self.minStrength
        valuesDict["areasProtected"] = self.areasProtected
        valuesDict["weight"] = self.weight
        return valuesDict
    }
    
    func generateModelFromDict(data: [String: Any]) -> ArmorModel {
        var newArmor = ArmorModel()
        
        newArmor.title = data["title"] as? String
        newArmor.cost = data["cost"] as? Int
        newArmor.notes = data["notes"] as? String
        newArmor.armorRating = data["armorRating"] as? Int
        newArmor.minStrength = data["minStrength"] as? Int
        newArmor.areasProtected = data["areasProtected"] as? [String]
        newArmor.weight = data["weight"] as? Int
        
        return newArmor
        
    }
    
}

class ShieldModel: NSObject {
    var title: String?
    var cost: Int?
    var notes: String?
    var parry: Int?
    var cover: Int?
    var minStrength: Int?
    var weight: Int?
    
    func generateDictForValues() -> [String: Any] {
        var valuesDict: [String: Any] = [:]
        valuesDict["title"] = self.title
        valuesDict["cost"] = self.title
        valuesDict["notes"] = self.notes
        valuesDict["parry"] = self.parry
        valuesDict["cover"] = self.cover
        valuesDict["minStrength"] = self.minStrength
        valuesDict["weight"] = self.weight
        return valuesDict
    }
    
    func generateModelFromDict(data: [String: Any]) -> ShieldModel {
        var newShield = ShieldModel()
        
        newShield.title = data["title"] as? String
        newShield.cost = data["cost"] as? Int
        newShield.notes = data["notes"] as? String
        newShield.parry = data["parry"] as? Int
        newShield.cover = data["cover"] as? Int
        newShield.minStrength = data["minStrength"] as? Int
        newShield.weight = data["weight"] as? Int
        
        return newShield
    }
    
}


class VehicleModel: NSObject {
    var title: String?
    var cost: Int?
    var notes: String?
    var size: String?
    var handling: String?
    var topSpeed: Int?
    var toughness: Int?
    var toughnessMod: Int?
    var requiredCrew: Int?
    var additionalPassengers: Int?
    var totalCapacity: Int {
        get {
            return (requiredCrew ?? 0) + (additionalPassengers ?? 0)
        }
        
    }
    
    func generateDictForValues() -> [String: Any] {
        var valuesDict: [String: Any] = [:]
        valuesDict["title"] = self.title
        valuesDict["cost"] = self.title
        valuesDict["notes"] = self.notes
        valuesDict["size"] = self.size
        valuesDict["handling"] = self.handling
        valuesDict["topSpeed"] = self.topSpeed
        valuesDict["toughness"] = self.toughness
        valuesDict["toughnessMod"] = self.toughnessMod
        valuesDict["requiredCrew"] = self.requiredCrew
        valuesDict["additionalPassengers"] = self.additionalPassengers
        return valuesDict
    }
    
    func generateModelFromDict(data: [String: Any]) -> VehicleModel {
        var newVehicle = VehicleModel()
        
        newVehicle.title = data["title"] as? String
        newVehicle.cost = data["cost"] as? Int
        newVehicle.notes = data["notes"] as? String
        newVehicle.size = data["size"] as? String
        newVehicle.handling = data["handling"] as? String
        newVehicle.topSpeed = data["topSpeed"] as? Int
        newVehicle.toughness = data["toughness"] as? Int
        newVehicle.toughnessMod = data["toughnessMod"] as? Int
        newVehicle.requiredCrew = data["requiredCrew"] as? Int
        newVehicle.additionalPassengers = data["additionalPassengers"] as? Int
        
        return newVehicle
        
    }
}


class PowerModel: NSObject {
    var title: String?
    var rank: String?
    var powerPoints: Int?
    var range: String?
    var duration: Int?
    var notes: String?
    
    func generateDictForValues() -> [String: Any] {
        var valuesDict: [String: Any] = [:]
        valuesDict["title"] = self.title
        valuesDict["rank"] = self.rank
        valuesDict["powerPoints"] = self.powerPoints
        valuesDict["range"] = self.range
        valuesDict["duration"] = self.duration
        valuesDict["notes"] = self.notes
        return valuesDict
    }
    
    func generateModelFromDict(data: [String: Any]) -> PowerModel {
        var newPower: PowerModel = PowerModel()
        newPower.title = data["title"] as? String
        newPower.rank = data["rank"] as? String
        newPower.powerPoints = data["powerPoints"] as? Int
        newPower.range = data["range"] as? String
        newPower.duration = data["duration"] as? Int
        newPower.notes = data["notes"] as? String
        return newPower
    }

}

