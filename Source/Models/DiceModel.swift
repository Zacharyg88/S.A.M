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
    
    func incrementDieType(isIncrease: Bool) -> DiceModel {
        let incrementedDice = DiceModel()
        let options = [4, 6, 8, 10, 12]
        let index = options.firstIndex(of: self.sides ?? 4)
        if isIncrease {
            if (index ?? 0) < 4 {
                incrementedDice.sides = options[(index ?? 0) + 1]
            }else {
                incrementedDice.sides = 12
            }
        }else {
            if (index ?? 0) != 0 {
                incrementedDice.sides = options[(index ?? 0) - 1]
            }else {
                incrementedDice.sides = 4
            }

        }
        incrementedDice.title = "d\(incrementedDice.sides ?? 4)"
        return incrementedDice
        
    }

}
