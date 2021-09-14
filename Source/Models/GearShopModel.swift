//
//  GearShopModel.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/10/21.
//

import Foundation


class GearShopModel: NSObject {
    
    var items: [ItemModel] = []
    var armor: [ArmorModel] = []
    var shields: [ShieldModel] = []
    var vehicles: [VehicleModel] = []
    var weapons: [WeaponModel] = []
    
    func generateDictFromObject() -> [String: Any] {
        var dict: [String: Any] = [:]
        var dictArray: [[String: Any]] = []
        for item in items {
            dictArray.append(item.generateDictForValues())
        }
        dict["items"] = dictArray
        dictArray.removeAll()
        for armor in armor  {
            dictArray.append(armor.generateDictForValues())
        }
        dict["armor"] = dictArray
        dictArray.removeAll()
        for shield in shields {
            dictArray.append(shield.generateDictForValues())
        }
        dict["shields"] = dictArray
        dictArray.removeAll()
        for vehicle in vehicles {
            dictArray.append(vehicle.generateDictForValues())
        }
        dict["vehicles"] = dictArray
        dictArray.removeAll()
        for weapon in weapons {
            dictArray.append(weapon.generateDictForValues())
        }
        dict["weapons"] = dictArray
     
        return dict
    }
    
    func generageObjectFromDict(dict: [String: Any]) -> GearShopModel {
        var gearShop: GearShopModel = GearShopModel()
        var itemsArray: [ItemModel] = []
        if let dictArray: [[String: Any]] = dict["items"] as? [[String: Any]]{
            for dict in dictArray {
                itemsArray.append(ItemModel().generateModelFromDict(data: dict))
            }
            gearShop.items = itemsArray
        }
        
        var armorArray: [ArmorModel] = []
        if let dictArray: [[String: Any]] = dict["armor"] as? [[String: Any]]{
            for dict in dictArray {
                armorArray.append(ArmorModel().generateModelFromDict(data: dict))
            }
            gearShop.armor = armorArray
        }
        
        var shieldArray: [ShieldModel] = []
        if let dictArray: [[String: Any]] = dict["shields"] as? [[String: Any]]{
            for dict in dictArray {
                shieldArray.append(ShieldModel().generateModelFromDict(data: dict))
            }
            gearShop.shields = shieldArray
        }
        
        var vehiclesArray: [VehicleModel] = []
        if let dictArray: [[String: Any]] = dict["vehicles"] as? [[String: Any]]{
            for dict in dictArray {
                vehiclesArray.append(VehicleModel().generateModelFromDict(data: dict))
            }
            gearShop.vehicles = vehiclesArray
        }
        
        var weaponsArray: [WeaponModel] = []
        if let dictArray: [[String: Any]] = dict["weapons"] as? [[String: Any]]{
            for dict in dictArray {
                weaponsArray.append(WeaponModel().generateModelFromDict(data: dict))
            }
            gearShop.weapons = weaponsArray
        }
        
        return gearShop
    }
}
