//
//  MissionModel.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/21/21.
//

import Foundation



class MissionModel: NSObject {
    
    var slug: String?
    var title: String?
    var missionDetailsShort: String?
    var target: String?
    var missionDetailsLong: String?
    var imageURL: String?
    var missionType: String?
    var missionLocation: String?
    var votes: [String]?
    
    
    func generateDictForValues() -> [String: Any] {
        var valuesDict: [String: Any] = [:]
        valuesDict["title"] = self.title
        valuesDict["missionDetailsShort"] = self.missionDetailsShort
        valuesDict["missionDetailsLong"] = self.missionDetailsLong
        valuesDict["target"] = self.target
        valuesDict["imageURL"] = self.imageURL
        valuesDict["missionType"] = self.missionType
        valuesDict["missionLocation"] = self.missionLocation
        valuesDict["votes"] = self.votes
        return valuesDict
    }
    
    func generateModelFromDict(data: [String: Any], slug: String?) -> MissionModel {
        var newMission = MissionModel()
        newMission.slug = slug
        newMission.title = data["title"] as? String
        newMission.missionDetailsShort = data["missionDetailsShort"] as? String
        newMission.target = data["target"] as? String
        newMission.missionDetailsLong = data["missionDetailsLong"] as? String
        newMission.imageURL = data["imageURL"] as? String
        newMission.missionType = data["missionType"] as? String
        newMission.missionLocation = data["missionLocation"] as? String
        newMission.votes = data["votes"] as? [String]
        return newMission
    }
    
    
}
