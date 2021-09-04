//
//  HeroGearView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 8/30/21.
//

import Foundation
import UIKit

protocol HeroItemDetailDelegate {
    func showDetailForItem(object: Any)
}

class HeroGearView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var manageInventoryButton: UIButton!
    @IBOutlet weak var goldCountLabel: UILabel!
    
    var weapons: [WeaponModel] = []
    var armor: [ArmorModel] = []
    var shields: [ShieldModel] = []
    var items: [ItemModel] = []
    
    var delegate: HeroItemDetailDelegate?
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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "HeroGearTableViewCell", bundle: nil), forCellReuseIdentifier: "HeroGearTableViewCell")

        manageInventoryButton.layer.borderWidth = 2
        manageInventoryButton.layer.borderColor = UIColor(named: "SWButton_Border")?.cgColor
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: SWGearTableViewHeaderView = SWGearTableViewHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 36))
        switch section {
        case 0:
            view.leftImageView.image = UIImage(named: "icon_weapons")
            view.titleLabel.text = "Weapons"
        case 1:
            view.leftImageView.image = UIImage(named: "icon_shield_half")
            view.titleLabel.text = "Defenses"
        default:
            view.leftImageView.image = UIImage(named: "icon_toolbox")
            view.titleLabel.text = "Items"
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 113
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return weapons.count
        case 1:
            return (armor.count + shields.count)
        default:
            return items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: HeroGearTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HeroGearTableViewCell", for: indexPath) as? HeroGearTableViewCell {
            switch indexPath.section {
            case 0:
                cell.weaponItem = weapons[indexPath.row]
            case 1:
                if indexPath.row > self.armor.count {
                    cell.shieldItem = shields[indexPath.row - self.armor.count]
                }else {
                    cell.armorItem = armor[indexPath.row]
                }
            default:
                cell.itemItem = items[indexPath.row]
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            //weapons
            delegate?.showDetailForItem(object: weapons[indexPath.row])
        case 1:
            if indexPath.row > self.armor.count {
                delegate?.showDetailForItem(object: self.armor[indexPath.row])
            }else {
                delegate?.showDetailForItem(object: self.shields[indexPath.row - self.armor.count])
            }
        default:
            delegate?.showDetailForItem(object: items[indexPath.row])
        }
    }
    
}
