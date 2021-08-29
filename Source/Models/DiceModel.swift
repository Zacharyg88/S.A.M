//
//  DiceModel.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/19/21.
//

import Foundation


class DiceModel: NSObject {
    var title: String?
    var sides: Int?
    
    
    func generateDictForValues() -> [String: Any] {
        var valuesDict: [String: Any] = [:]
        valuesDict["title"] = self.title
        valuesDict["sides"] = self.sides
        return valuesDict
    }
    
    func generateModelFromDict(data: [String: Any]) -> DiceModel {
        let diceModel = DiceModel()
        diceModel.title = data["title"] as? String
        diceModel.sides = data["sides"] as? Int
        
        return diceModel
    }
    
    func roll() -> Int {
        return Int.random(in: 0...(self.sides ?? 0))
    }

}
