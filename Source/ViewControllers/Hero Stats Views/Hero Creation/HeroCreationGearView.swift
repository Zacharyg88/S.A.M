//
//  HeroCreationGearView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/3/21.
//

import Foundation
import UIKit

class HeroCreationGearView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var remainingGoldLabel: UILabel!
    
    var gearShop: GearShopModel?
    var shouldShowWeapons: Bool = false
    var shouldShowArmor: Bool = false
    var shouldShowShields: Bool = false
    var shouldShowItems: Bool = false
    var shouldShowVehicles: Bool = false
    var hostVC: SWHeroCreationViewController?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadAndShowNib()
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadAndShowNib()
        setupView()
    }
    
    func setupView() {
        databaseManager.getGearShopFromDatabase { gearShop, error in
            if error != nil {
                print("There was an error getting the gear shop from the database \(error)")
            }else {
                self.gearShop = gearShop
            }
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HeroGearTableViewCell", bundle: nil), forCellReuseIdentifier: "HeroGearTableViewCell")
        tableView.tableFooterView = UIView()
        self.remainingGoldLabel.text = "\(self.hostVC?.newHero.gold ?? 1500)"
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: HeroCreationGearShopHeaderView = HeroCreationGearShopHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 64))
        headerView.headerImageView.tintColor = .white
        switch section {
        case 0:
            headerView.headerLabel.text = "Weapons"
            headerView.headerImageView.image = UIImage(named: "icon_weapons")?.imageWithTint(.white)
            headerView.backgroundColor = UIColor(named: "SWRed")
        case 1:
            headerView.headerLabel.text = "Armor"
            headerView.headerImageView.image = UIImage(named: "icon_hero")?.imageWithTint(.white)
            headerView.backgroundColor = UIColor(named: "SWStrength_Vigor")

        case 2:
            headerView.headerLabel.text = "Shields"
            headerView.headerImageView.image = UIImage(named: "icon_shield_half")?.imageWithTint(.white)
            headerView.backgroundColor = UIColor(named: "SWGreen")
            
        case 3:
            headerView.headerLabel.text = "Items"
            headerView.headerImageView.image = UIImage(named: "icon_toolbox")?.imageWithTint(.white)
            headerView.backgroundColor = UIColor(named: "SWSpirit")

        default:
            headerView.headerLabel.text = "Vehicles"
            headerView.headerImageView.image = UIImage(named: "icon_vehicles")?.imageWithTint(.white)
            headerView.backgroundColor = UIColor(named: "SWGreen_Light")
        }
        headerView.tag = section
        let headerTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(headerTapped(_:)))
        headerView.addGestureRecognizer(headerTap)
        return headerView
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    @objc func headerTapped(_ sender: UITapGestureRecognizer) {
        switch sender.view?.tag {
        case 0:
            self.shouldShowWeapons = !self.shouldShowWeapons
        case 1:
            self.shouldShowArmor = !self.shouldShowArmor
        case 2:
            self.shouldShowShields = !self.shouldShowShields
        case 3:
            self.shouldShowItems = !self.shouldShowItems
        default:
            self.shouldShowVehicles = !self.shouldShowVehicles
        }
        self.tableView.reloadSections([sender.view?.tag ?? 0], with: .automatic)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            if shouldShowWeapons {
                return gearShop?.weapons.count ?? 0
            }else {
                return 0
            }
        case 1:
            if shouldShowArmor {
                return gearShop?.armor.count ?? 0
            }else {
                return 0
            }
        case 2:
            if shouldShowShields {
                return gearShop?.shields.count ?? 0
            }else {
                return 0
            }
        case 3:
            if shouldShowItems {
                return gearShop?.items.count ?? 0
            }else {
                return 0
            }
        default:
            if shouldShowVehicles {
                return gearShop?.vehicles.count ?? 0
            }else {
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: HeroGearTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HeroGearTableViewCell", for: indexPath) as? HeroGearTableViewCell {
            cell.quantityLabel.isHidden = true
            cell.damageLabel.isHidden = true
            cell.damageStatsLabel.isHidden = true
            cell.activatePowerButton.isHidden = false
            cell.activatePowerButton.setTitle("Purchase", for: UIControl.State())
            cell.activatePowerButton.backgroundColor = UIColor(named: "SWStrength_Vigor")
            switch indexPath.section {
            case 0:
                cell.weaponItem = gearShop?.weapons[indexPath.row]
            case 1:
                cell.armorItem = gearShop?.armor[indexPath.row]
            case 2:
                cell.shieldItem = gearShop?.shields[indexPath.row]
            case 3:
                cell.itemItem = gearShop?.items[indexPath.row]
            default:
                cell.vehicleItem = gearShop?.vehicles[indexPath.row]
            }
            cell.gearShopView = self
            cell.isGearShop = true
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            // Weapons
            let weapon: WeaponModel = gearShop?.weapons[indexPath.row] ?? WeaponModel()
            self.hostVC?.showDetailForItem(object: weapon, image: nil)
        case 1:
            //Armor
            let armor: ArmorModel = gearShop?.armor[indexPath.row] ?? ArmorModel()
            self.hostVC?.showDetailForItem(object: armor, image: nil)

        case 2:
            //Shields
            let shield: ShieldModel = gearShop?.shields[indexPath.row] ?? ShieldModel()
            self.hostVC?.showDetailForItem(object: shield, image: nil)

        case 3:
            //Items
            let item: ItemModel = gearShop?.items[indexPath.row] ?? ItemModel()
            self.hostVC?.showDetailForItem(object: item, image: nil)

        default:
            //Vehicles
            let vehicle: VehicleModel = gearShop?.vehicles[indexPath.row] ?? VehicleModel()
            self.hostVC?.showDetailForItem(object: vehicle, image: nil)
        }
    }
    
    func purchaseItem(weapon: WeaponModel?, armor: ArmorModel?, shield: ShieldModel?, item: ItemModel?, vehicle: VehicleModel?) {
        if weapon != nil {
            if hostVC?.newHero.items.contains(weapon ?? WeaponModel()) ?? false {
                self.hostVC?.newHero.items.remove(at: self.hostVC?.newHero.items.firstIndex(of: weapon!) ?? 0)
                self.hostVC?.newHero.gold = (self.hostVC?.newHero.gold ?? 0) + (weapon?.cost ?? 0)
            }else {
                self.hostVC?.newHero.gold = (self.hostVC?.newHero.gold ?? 0) - (weapon?.cost ?? 0)
                self.hostVC?.newHero.items.append(weapon ?? NSObject())
            }
        }
        if armor != nil {
            if hostVC?.newHero.items.contains(armor ?? ArmorModel()) ?? false {
                self.hostVC?.newHero.items.remove(at: self.hostVC?.newHero.items.firstIndex(of: armor!) ?? 0)
                self.hostVC?.newHero.gold = (self.hostVC?.newHero.gold ?? 0) + (armor?.cost ?? 0)
            }else {
                self.hostVC?.newHero.gold = (self.hostVC?.newHero.gold ?? 0) - (armor?.cost ?? 0)
                self.hostVC?.newHero.items.append(armor ?? NSObject())
            }
        }
        if shield != nil {
            if hostVC?.newHero.items.contains(shield ?? ShieldModel()) ?? false {
                self.hostVC?.newHero.items.remove(at: self.hostVC?.newHero.items.firstIndex(of: shield!) ?? 0)
                self.hostVC?.newHero.gold = (self.hostVC?.newHero.gold ?? 0) + (shield?.cost ?? 0)
            }else {
                self.hostVC?.newHero.gold = (self.hostVC?.newHero.gold ?? 0) - (shield?.cost ?? 0)
                self.hostVC?.newHero.items.append(shield ?? NSObject())
            }
        }
        
        if item != nil {
            if hostVC?.newHero.items.contains(item ?? ItemModel()) ?? false {
                self.hostVC?.newHero.items.remove(at: self.hostVC?.newHero.items.firstIndex(of: item!) ?? 0)
                self.hostVC?.newHero.gold = (self.hostVC?.newHero.gold ?? 0) + (item?.cost ?? 0)
            }else {
                self.hostVC?.newHero.gold = (self.hostVC?.newHero.gold ?? 0) - (item?.cost ?? 0)
                self.hostVC?.newHero.items.append(item ?? NSObject())
            }
        }
        
        if vehicle != nil {
            if hostVC?.newHero.items.contains(vehicle ?? VehicleModel()) ?? false {
                self.hostVC?.newHero.items.remove(at: self.hostVC?.newHero.items.firstIndex(of: vehicle!) ?? 0)
                self.hostVC?.newHero.gold = (self.hostVC?.newHero.gold ?? 0) + (vehicle?.cost ?? 0)
            }else {
                self.hostVC?.newHero.gold = (self.hostVC?.newHero.gold ?? 0) - (vehicle?.cost ?? 0)
                self.hostVC?.newHero.items.append(vehicle ?? NSObject())
            }
        }
        self.remainingGoldLabel.text = "\(self.hostVC?.newHero.gold ?? 0)"

    }
    
}
