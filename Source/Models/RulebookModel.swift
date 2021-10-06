//
//  RulebookModel.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/1/21.
//

import Foundation
var ruleBook = RulebookModel()
class RulebookModel: NSObject {
    var slug: String?
    var attributes = Attributes()
    var conditions = Conditions()
    var skills = Skills()
    var races = Races()
    var hinderances = Hinderances()
    var edges = Edges()
    
    func generateDictFromModel() -> [String: Any] {
        let dict: [String: Any] = [
            "attributes": attributes.generateDictFromObject(),
            "conditions": conditions.generateDictFromModel(),
            "skills": skills.generateDictFromObject(),
            "races": races.generateDictFromObject(),
            "hindrances": hinderances.generateDictFromObject(),
            "edges": edges.generateDictFromObject(),
        ]
        
        return dict
    }
    
    func generateObjectFromDict(dict: [String: Any]) -> RulebookModel {
        let newRulebook = RulebookModel()
        if let attributes: [String: Any] = dict["attributes"] as? [String: Any] {
            newRulebook.attributes = Attributes().generateObjectFromDict(dict: attributes)
        }
        var conditionsArray:[ConditionModel] = []
        if let conditions: [[String: Any]] = dict["conditions"] as? [[String: Any]] {
            for i in conditions {
                conditionsArray.append(ConditionModel().generateObjectFromDict(dict: i))
            }
        }
        var newConditions: Conditions = Conditions()
        newConditions.conditions = conditionsArray
        newRulebook.conditions = newConditions
        if let skills: [String: Any] = dict["skills"] as? [String: Any] {
            newRulebook.skills = Skills().generateModelFromDict(dict: skills)
        }
        if let races: [String: Any] = dict["races"] as? [String: Any] {
            newRulebook.races = Races().generateObjectFromDict(dict: races)
        }
        if let hinderances: [String: Any] = dict["hindrances"] as? [String: Any] {
            newRulebook.hinderances = Hinderances().generateModelFromDict(dict: hinderances)
        }
        if let edges: [String: Any] = dict["edges"] as? [String: Any] {
            newRulebook.edges = Edges().generateObjectFromDict(dict: edges)
        }
        
        return newRulebook
    }
    
    
}

class Conditions: NSObject {
    var conditions: [ConditionModel] = []
    
    func generateDictFromModel() -> [String: Any] {
        var dict: [String: Any] = [:]
        var dictArray: [[String: Any]] = []
        for condition in conditions {
            dictArray.append(condition.generateDictFromObject())
        }
        dict["conditions"] = dictArray
        return dict
    }
    
    func generateObjectFromDict(dict: [String: Any]) -> Conditions {
        let newConditions = Conditions()
        if let dictArray: [[String: Any]] = dict["conditions"] as? [[String: Any]] {
            for dict in dictArray {
                newConditions.conditions.append(ConditionModel().generateObjectFromDict(dict: dict))
            }
        }
        return newConditions
    }
    
}


class ConditionModel: NSObject {
    var title: String?
    var summary: String?
    
    func generateDictFromObject() -> [String: Any] {
        let dict: [String: Any] = [
            "title": self.title,
            "summary": self.summary
        ]
        return dict
    }
    
    func generateObjectFromDict(dict: [String: Any]) -> ConditionModel {
        let newCondition = ConditionModel()
        newCondition.title = dict["title"] as! String?
        newCondition.summary = dict["summary"] as! String?
        
        return newCondition
    }
}

class RB_Race: NSObject {
    var generalDescription: String?
    var raceSpecificTraits: String?
    var imageLocation: String?
    var title: String?
    
    convenience init(title: String?, generalDescription: String?, traits: String?, imageLocation: String?) {
        self.init()
        self.title = title
        self.generalDescription = generalDescription
        self.raceSpecificTraits = traits
        self.imageLocation = imageLocation
    }
    
    func generateDictFromObject() -> [String: Any] {
        var objectDict: [String: Any] = [
            "generalDescription": self.generalDescription,
            "raceSpecificTraits": self.raceSpecificTraits,
            "imageLocation": self.imageLocation,
            "title": self.title
        ]
        return objectDict
    }
    
    func generateObjectFromDict(dict: [String: Any]) -> RB_Race {
        var newRace: RB_Race = RB_Race(title: dict["title"] as! String, generalDescription: dict["generalDescription"] as! String, traits: dict["raceSpecificTraits"] as! String, imageLocation: dict["imageLocation"] as! String)
        return newRace
    }
}

class Races: NSObject {
    var generalDescription = ""
    var racesArray: [RB_Race] = []
    func generateDictFromObject() -> [String: Any] {
        var dict: [String: Any] = [
            "generalDescription": self.generalDescription,
        ]
        var dictArray: [[String: Any]] = []
        for race in racesArray {
            dictArray.append(race.generateDictFromObject())
        }
        dict["racesArray"] = dictArray
        
        return dict
    }
    
    func generateObjectFromDict(dict: [String: Any]) -> Races {
        let newRaces = Races()
        newRaces.generalDescription = dict["generalDescription"] as? String  ?? ""
        if let dictArray : [[String: Any]] = dict["racesArray"] as? [[String: Any]] {
            for dict in dictArray {
                newRaces.racesArray.append(RB_Race().generateObjectFromDict(dict: dict))
            }
        }
        return newRaces
    }
}

class Attributes: NSObject {
    
    var attributes = [AttributeModel]()
    var generalDescription: String?
    
    func generateDictFromObject() -> [String: Any] {
        var dict: [String: Any] = [
            "generalDescription": self.generalDescription
        ]
        var attributeArray: [[String: Any]] = []
        for attribute in attributes {
            attributeArray.append(attribute.generateDictForValues())
        }
        dict["attributes"] = attributeArray
        return dict
    }
    
    func generateObjectFromDict(dict: [String: Any]) -> Attributes {
        var newAttributes: Attributes = Attributes()
        newAttributes.generalDescription = dict["generalDescription"] as? String
        if let attributeArray: [[String: Any]] = dict["attributes"] as? [[String: Any]] {
            for dict in attributeArray {
                newAttributes.attributes.append(AttributeModel().generateModelFromDict(data: dict))
            }
        }
        
        return newAttributes
    }
}

class Skills: NSObject {
    
    var generalDescription = ""
    var skills: [RB_Skill] = []

    func generateDictFromObject() -> [String: Any] {
        var dict: [String: Any] = [
            "generalDescription": self.generalDescription
        ]
        
        var dictArray: [[String: Any]] = []
        for skill in skills {
            dictArray.append(skill.generateDictFromObject())
        }
        dict["skills"] = dictArray
        
        return dict
    }
    
    func generateModelFromDict(dict: [String: Any]) -> Skills {
        let newSkills: Skills = Skills()
        newSkills.generalDescription = dict["generalDescription"] as? String ?? ""
        
        if let dictArray: [[String: Any]] = dict["skills"] as? [[String: Any]] {
            for dict in dictArray {
                newSkills.skills.append(RB_Skill().generateObjectFromDict(dict: dict))
            }
        }
        
        return newSkills
    }
    
}
class RB_Skill: NSObject {
    var title = ""
    var summary = ""
    var attribute = ""
    
    override init() {
        super.init()
    }
    convenience init(summary: String, attribute: String, title: String) {
        self.init()
        self.summary = summary
        self.attribute = attribute
        self.title = title
    }
    
    func generateDictFromObject() -> [String: Any] {
        let dict: [String: Any] = [
            "title": self.title,
            "summary": self.summary,
            "attribute": self.attribute
        ]
        return dict
    }
    
    func generateObjectFromDict(dict: [String: Any]) -> RB_Skill {
        let newSkill: RB_Skill = RB_Skill(summary: dict["summary"] as! String, attribute: dict["attribute"] as! String, title: dict["title"] as! String)
        return newSkill
    }
}


class Hinderances: NSObject {
    
    var generalDescription = ""
    var hinderances: [HindranceModel]?
    
    func generateDictFromObject() -> [String: Any] {
        var dict: [String: Any] = [
            "generalDescription": self.generalDescription
        ]
        
        var dictArray: [[String: Any]] = []
        for hindrance in hinderances ?? [HindranceModel]() {
            dictArray.append(hindrance.generateDictForValues())
        }
        dict["hinderances"] = dictArray
        
        return dict
    }
    
    func generateModelFromDict(dict: [String: Any]) -> Hinderances {
        var hinderances: Hinderances = Hinderances()
        hinderances.generalDescription = dict["generalDescription"] as! String
        var hindranceArray: [HindranceModel] = []
        if let dictArray: [[String: Any]] = dict["hinderances"] as? [[String: Any]] {
            for dict in dictArray {
                hindranceArray.append(HindranceModel().generateModelFromDict(data: dict))
            }
        }
        hinderances.hinderances = hindranceArray
        
        return hinderances
    }
    
}


class EdgeCategory: NSObject {
    var generalDescription: String?
    var edges: [EdgeModel] = []
    
    convenience init(generalDescription: String, edges: [EdgeModel])  {
        self.init()
        
        self.generalDescription = generalDescription
        self.edges = edges
    }
    
    func generateDictFromObject() -> [String: Any] {
        var dict: [String: Any] = [
            "generalDescription": self.generalDescription
        ]
        var edgeDictArray: [[String: Any]] = []
        for edge in self.edges {
            edgeDictArray.append(edge.generateDictForValues())
        }
        dict["edges"] = edgeDictArray
        return dict
    }
    
    func generateObjectFromDict(dict: [String: Any]) -> EdgeCategory {
        var edges: [EdgeModel] = []
        if let edgesDictArray = dict["edges"] as? [[String: Any]] {
            for dict in edgesDictArray {
                let parsedEdge: EdgeModel = EdgeModel().generateModelFromDict(data: dict)
                edges.append(parsedEdge)
                
            }
        }
        let edgeCategory: EdgeCategory = EdgeCategory(generalDescription: dict["generalDescription"] as! String, edges: edges)
        return edgeCategory
    }
}

class Edges: NSObject {
    
    var Background_Edges: EdgeCategory?
    var Combat_Edges: EdgeCategory?
    var Leadership_Edges: EdgeCategory?
    var Power_Edges: EdgeCategory?
    var Professional_Edges: EdgeCategory?
    var Social_Edges: EdgeCategory?
    var Weird_Edges: EdgeCategory?
    var Legendary_Edges: EdgeCategory?
    
    
    func generateDictFromObject() -> [String: Any] {
        let dict: [String: Any] = [
            "Background_Edges": self.Background_Edges?.generateDictFromObject(),
            "Combat_Edges": self.Combat_Edges?.generateDictFromObject(),
            "Leadership_Edges": self.Leadership_Edges?.generateDictFromObject(),
            "Power_Edges": self.Power_Edges?.generateDictFromObject(),
            "Professional_Edges": self.Professional_Edges?.generateDictFromObject(),
            "Social_Edges": self.Social_Edges?.generateDictFromObject(),
            "Weird_Edges": self.Weird_Edges?.generateDictFromObject(),
            "Legendary_Edges": self.Legendary_Edges?.generateDictFromObject(),
            
        ]
        return dict
    }
    
    func generateObjectFromDict(dict: [String: Any]) -> Edges {
        let newEdges: Edges = Edges()
        if let Background_Edges = dict["Background_Edges"] as? [String: Any] {
            newEdges.Background_Edges = EdgeCategory().generateObjectFromDict(dict: Background_Edges)
        }
        if let Combat_Edges = dict["Combat_Edges"] as? [String: Any] {
            newEdges.Combat_Edges = EdgeCategory().generateObjectFromDict(dict: Combat_Edges)
        }
        if let Leadership_Edges = dict["Leadership_Edges"] as? [String: Any] {
            newEdges.Leadership_Edges = EdgeCategory().generateObjectFromDict(dict: Leadership_Edges)
        }
        if let Power_Edges = dict["Power_Edges"] as? [String: Any] {
            newEdges.Power_Edges = EdgeCategory().generateObjectFromDict(dict: Power_Edges)
        }
        if let Professional_Edges = dict["Professional_Edges"] as? [String: Any] {
            newEdges.Professional_Edges = EdgeCategory().generateObjectFromDict(dict: Professional_Edges)
        }
        if let Social_Edges = dict["Social_Edges"] as? [String: Any] {
            newEdges.Social_Edges = EdgeCategory().generateObjectFromDict(dict: Social_Edges)
        }
        if let Weird_Edges = dict["Weird_Edges"] as? [String: Any] {
            newEdges.Weird_Edges = EdgeCategory().generateObjectFromDict(dict: Weird_Edges)
        }
        if let Legendary_Edges = dict["Legendary_Edges"] as? [String: Any] {
            newEdges.Legendary_Edges = EdgeCategory().generateObjectFromDict(dict: Legendary_Edges)
        }
        
        return newEdges
    }
    
}





