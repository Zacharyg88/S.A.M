//
//  MechanicsModels.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/20/21.
//

import Foundation



class SkillModel: NSObject {
    var title: String?
    var attribute: String?
    var dice: DiceModel?
    
    func generateDictForValues() -> [String: Any] {
        var valuesDict: [String: Any] = [:]
        valuesDict["title"] = self.title
        valuesDict["attribute"] = self.attribute
        valuesDict["dice"] = self.dice?.generateDictForValues()
        return valuesDict
    }
    
    func generateModelFromDict(data: [String: Any]) -> SkillModel {
        var skillModel = SkillModel()
        skillModel.title = data["title"] as? String
        skillModel.attribute = data["attribute"] as? String
        if let diceDict: [String: Any] = data["dice"] as? [String: Any] {
            skillModel.dice = DiceModel().generateModelFromDict(data: diceDict)
        }
        return skillModel
    }
    
}


class AttributeModel: NSObject {
    var title: String?
    var summary: String?
    var dice: DiceModel?
    
    func generateDictForValues() -> [String: Any] {
        var valuesDict: [String: Any] = [:]
        valuesDict["title"] = self.title
        valuesDict["summary"] = self.summary
        valuesDict["dice"] = self.dice?.generateDictForValues()
        return valuesDict
    }
    
    func generateModelFromDict(data: [String: Any]) -> AttributeModel {
        var newAttribute = AttributeModel()
        newAttribute.title = data["title"] as? String
        newAttribute.summary = data["summary"] as? String
        if let diceDict: [String: Any] = data["dice"] as? [String: Any] {
            newAttribute.dice = DiceModel().generateModelFromDict(data: diceDict)
        }
        return newAttribute
    }
}

class EdgeModel: NSObject {
    var title: String?
    var requiredExperience: String?
    var requiredSkillName: String?
    var requiredSkillLevel: String?
    var summary: String?
    var modifier: ModifierModel?
    
    func generateDictForValues() -> [String: Any] {
        var valuesDict: [String: Any] = [:]
        valuesDict["title"] = self.title
        valuesDict["requiredExperience"] = self.requiredExperience
        valuesDict["requiredSkillName"] = self.requiredSkillName
        valuesDict["requiredSkillLevel"] = self.requiredSkillLevel
        valuesDict["summary"] = self.summary
        valuesDict["modifier"] = self.modifier?.generateDictForValues()
        return valuesDict
    }
    
    func generateModelFromDict(data: [String: Any]) -> EdgeModel {
        var newEdge: EdgeModel = EdgeModel()
        newEdge.title = data["title"] as? String
        newEdge.requiredExperience = data["requiredExperience"] as? String
        newEdge.requiredSkillName = data["requiredSkillName"] as? String
        newEdge.requiredSkillLevel = data["requiredSkillLevel"] as? String
        newEdge.summary = data["summary"] as? String
        if let modDict: [String:  Any] = data["modifier"] as? [String: Any] {
            newEdge.modifier = ModifierModel().generateModelFromDict(data: modDict)
        }
        return newEdge
    }
}

class HindranceModel: NSObject {
    var title: String?
    var level: String?
    var summary: String?
    var modifier: ModifierModel?
    
    func generateDictForValues() -> [String: Any] {
        var valuesDict: [String: Any] = [:]
        valuesDict["title"] = self.title
        valuesDict["level"] = self.level
        valuesDict["summary"] = self.summary
        valuesDict["modifier"] = self.modifier?.generateDictForValues()
        return valuesDict
    }
    
    func generateModelFromDict(data: [String: Any]) -> HindranceModel {
        var newHindrance = HindranceModel()
        newHindrance.title = data["title"] as? String
        newHindrance.level = data["level"] as? String
        newHindrance.summary = data["summary"] as? String
        if let modDict: [String: Any] = data["modifier"] as? [String: Any] {
            newHindrance.modifier = ModifierModel().generateModelFromDict(data: modDict)
        }
        return newHindrance
    }
}



class ModifierModel: NSObject {
    var isPositive: Bool = false
    var modInt: Int?
    var attribute: String?
    var skill: String?
    
    func generateDictForValues() -> [String: Any] {
        var valuesDict: [String: Any] = [:]
        valuesDict["isPositive"] = self.isPositive
        valuesDict["modInt"] = self.modInt
        valuesDict["attribute"] = self.attribute
        valuesDict["skill"] = self.skill
        return valuesDict
    }
    
    func generateModelFromDict(data: [String: Any]) -> ModifierModel {
        var newModifier = ModifierModel()
        newModifier.isPositive = data["isPositive"] as? Bool ?? false
        newModifier.modInt = data["modInt"] as? Int
        newModifier.attribute = data["attribute"] as? String
        newModifier.skill = data["skill"] as? String
        
        return newModifier
    }
    

    
}
