//
//  HeroGearTableViewCell.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 8/30/21.
//

import UIKit

class HeroGearTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gearCellBanner: UIView!
    @IBOutlet weak var gearTypeLabel: UILabel!
    @IBOutlet weak var gearNameLabel: UILabel!
    @IBOutlet weak var damageLabel: UILabel!
    @IBOutlet weak var damageStatsLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var rangeStatsLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var notesDescriptionLabel: UILabel!
    @IBOutlet weak var rofLabel: UILabel!
    @IBOutlet weak var rofStatLabel: UILabel!
    @IBOutlet weak var apLabel: UILabel!
    @IBOutlet weak var apStatLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightStatLabel: UILabel!
    @IBOutlet weak var activatePowerButton: UIButton!

    var itemType: String = ""
    var weaponItem: WeaponModel? {
        didSet {
            self.itemType = "weapon"
            activatePowerButton.isHidden = true
            self.gearCellBanner.backgroundColor = UIColor(named: "SWRed")
            self.gearTypeLabel.text = "Weapon"
            self.gearNameLabel.text = weaponItem?.title ?? ""
            self.damageLabel.text = "Damage"
            self.damageStatsLabel.text = weaponItem?.damageString ?? ""
            self.quantityLabel.text = "\(weaponItem?.quantity ?? 0)"
            self.rangeLabel.text = "Range"
            self.rangeStatsLabel.text = weaponItem?.range ?? ""
            self.notesLabel.text = "Notes"
            self.notesDescriptionLabel.text = weaponItem?.notes ?? ""
            self.rofLabel.isHidden = false
            self.rofLabel.text = "ROF"
            self.rofStatLabel.text = "\(weaponItem?.rof ?? 0)"
            self.apLabel.text = "AP"
            self.apStatLabel.text = "\(weaponItem?.ap ?? 0)"
            self.apLabel.isHidden = false
            self.apStatLabel.isHidden = false
            self.weightLabel.text = "Weight"
            self.weightStatLabel.text = "\(weaponItem?.weight ?? 0)" + " lbs"
        }
    }
    var armorItem: ArmorModel? {
        didSet {
            self.itemType = "armor"
            activatePowerButton.isHidden = true

            self.gearCellBanner.backgroundColor = UIColor(named: "SWBlue")
            self.gearTypeLabel.text = "Defense"
            self.gearNameLabel.text = armorItem?.title ?? ""
            self.quantityLabel.isHidden = true
            self.damageLabel.text = "Armor Value"
            self.damageStatsLabel.text = "+" + "\(armorItem?.armorRating ?? 0)"
            self.rangeLabel.text = "Notes"
            var areaString = ""
            for area in armorItem?.areasProtected ?? [String]() {
                if areaString != "" {
                    areaString.append(", \(area)")
                }else {
                    areaString.append(area)
                }
            }
            self.rangeStatsLabel.text = areaString
            self.notesLabel.isHidden = true
            self.notesDescriptionLabel.isHidden = true
            self.rofLabel.isHidden = true
            self.rofStatLabel.isHidden = true
            self.apLabel.isHidden = true
            self.apStatLabel.isHidden = true
            self.weightLabel.text = "Weight"
            self.weightStatLabel.text = "\(armorItem?.weight ?? 0)" + " lbs"
        }
    }
    var shieldItem: ShieldModel? {
        didSet {
            self.itemType = "shield"
            activatePowerButton.isHidden = true

            self.gearCellBanner.backgroundColor = UIColor(named: "SWBlue")
            self.gearTypeLabel.text = "Defense"
            self.gearNameLabel.text = shieldItem?.title ?? ""
            self.quantityLabel.isHidden = true
            self.damageLabel.text = "Shield Value"
            self.damageStatsLabel.text = "+" + "\(shieldItem?.cover ?? 0)"
            self.rangeLabel.text = "Notes"
            self.rangeStatsLabel.text = "+ " + "\(shieldItem?.cover ?? 0) to cover."
            self.notesLabel.isHidden = true
            self.notesDescriptionLabel.isHidden = true
            self.rofLabel.isHidden = true
            self.rofStatLabel.isHidden = true
            self.apLabel.isHidden = true
            self.apStatLabel.isHidden = true
            self.weightLabel.text = "Weight"
            self.weightStatLabel.text = "\(armorItem?.weight ?? 0)" + " lbs"
        }
    }
    var itemItem: ItemModel? {
        didSet {
            self.itemType = "item"
            activatePowerButton.isHidden = true

            self.gearCellBanner.backgroundColor = UIColor(named: "SWGreen")
            self.gearTypeLabel.text = "Item"
            self.gearNameLabel.text = itemItem?.title ?? ""
            self.quantityLabel.isHidden = false
            self.damageLabel.isHidden = true
            self.damageStatsLabel.isHidden = true
            self.quantityLabel.text = "\(itemItem?.quantity ?? 0)"
            self.rangeLabel.text = "Notes"
            self.rangeStatsLabel.text = itemItem?.notes
            self.notesLabel.isHidden = true
            self.notesDescriptionLabel.isHidden = true
            self.rofLabel.isHidden = true
            self.rofStatLabel.isHidden = true
            self.apLabel.isHidden = true
            self.apStatLabel.isHidden = true
            self.weightLabel.text = "Weight"
            self.weightStatLabel.text = "\(armorItem?.weight ?? 0)" + " lbs"
        }
    }
    
    var powerItem: PowerModel? {
        didSet {
            self.itemType = "power"
            self.activatePowerButton.isHidden = false
            self.gearCellBanner.backgroundColor = UIColor(named: "SWPower")
            self.gearTypeLabel.text = "Power"
            self.gearNameLabel.text = powerItem?.title ?? ""
            self.quantityLabel.isHidden = true
            self.damageLabel.isHidden = true
            self.damageStatsLabel.isHidden = true
            self.rangeLabel.text = "PP"
            self.rangeStatsLabel.text = "\(powerItem?.powerPoints)"
            self.notesLabel.text = "Range"
            self.notesDescriptionLabel.text = powerItem?.range ?? ""
            self.weightLabel.text = "Duration"
            if powerItem?.duration ?? 0 > 0 {
                self.weightStatLabel.text = "\(powerItem?.duration ?? 0) turns"
            }else {
                self.weightStatLabel.text = "Instant"
            }
            self.apLabel.isHidden = true
            self.apStatLabel.isHidden = true
            self.rofLabel.text = "Rank"
            self.rofStatLabel.text = powerItem?.rank ?? ""
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        activatePowerButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        activatePowerButton.layer.shadowColor = UIColor.black.cgColor
        activatePowerButton.layer.shadowOpacity = 0.75
        activatePowerButton.layer.shadowRadius = 8
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
