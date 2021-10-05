//
//  UI Extensions.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 8/27/21.
//

import Foundation
import UIKit


extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    func getColorFromAttribute(attribute: String) -> UIColor {
        switch attribute {
        case "Agility":
            return colors.AgilityColor
        case "Spirit":
            return colors.SpiritColor
        case "Smarts":
            return colors.SmartsColor
        default:
            return colors.StrengthColor
        }
    }
}


extension UIView {
    func loadAndShowNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.className, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
}


extension UIImage {
    func imageWithTint(_ color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.setFill()
        
        let context = UIGraphicsGetCurrentContext()! as CGContext
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0);
        context.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height) as CGRect
        context.clip(to: rect, mask: self.cgImage!)
        context.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}


extension UIViewController {
    
    
    func showDetailForItem(object: Any, image: UIImage?) {
        var detailView: HeroObjectDetailsView = HeroObjectDetailsView(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY, width: self.view.frame.width, height: UIScreen.main.bounds.height / 2))
        let labelArray = [detailView.leftHeader1, detailView.leftHeader2, detailView.leftHeader3, detailView.leftHeader4, detailView.leftDescription1, detailView.leftDescription2, detailView.leftDescription3, detailView.leftDescription4, detailView.rightHeader1, detailView.rightHeader2, detailView.rightHeader3, detailView.rightDescription1, detailView.rightDescription2, detailView.rightDescription3]
        if let weapon: WeaponModel = object as? WeaponModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWRed")
            detailView.typeLabel.text = "Weapon"
            detailView.nameLabel.text = weapon.title ?? ""
            detailView.leftHeader1.text = "Damage"
            detailView.leftDescription1.text = weapon.damageString ?? ""
            detailView.rightHeader1.text = "ROF"
            detailView.rightDescription1.text = "\(weapon.rof ?? 0)"
            detailView.leftHeader2.text = "Range"
            detailView.leftDescription2.text = weapon.range ?? ""
            detailView.rightHeader2.text = "AP"
            detailView.rightHeader2.text = "\(weapon.ap ?? 0)"
            detailView.leftHeader3.text = "Notes"
            detailView.leftDescription3.text = weapon.notes ?? ""
            detailView.rightHeader3.text = "Weight"
            detailView.rightDescription3.text = "\(weapon.weight ?? 0) lbs"
            detailView.leftHeader4.text = weapon.classification ?? ""
            detailView.leftDescription4.text = weapon.notes ?? ""
            
        }
        if let armor: ArmorModel = object as? ArmorModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWBlue")
            detailView.typeLabel.text = "Armor"
            detailView.nameLabel.text = armor.title ?? ""
            detailView.leftHeader1.text = "Armor Value"
            detailView.leftDescription1.text = "+\(armor.armorRating ?? 0)"
            detailView.rightHeader1.text = "Weight"
            detailView.rightDescription1.text = "\(armor.weight ?? 0) lbs"
            detailView.leftHeader2.text = "Areas Protected"
            var protectedString = ""
            for area in armor.areasProtected {
                if protectedString == "" {
                    protectedString.append(area ?? "")
                }else {
                    protectedString.append(", " + area ?? "")
                }
            }
            detailView.leftDescription2.text = protectedString
            detailView.leftHeader3.text = "Notes"
            detailView.leftDescription3.text = armor.notes ?? ""
            
        }
        if let shield: ShieldModel = object as? ShieldModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWBlue")
            detailView.typeLabel.text = "Shield"
            detailView.nameLabel.text = shield.title ?? ""
            detailView.leftHeader1.text = "Shield Rating"
            detailView.leftDescription1.text = "+\(shield.cover ?? 0)"
            detailView.rightHeader1.text = "Weight"
            detailView.rightDescription1.text = "\(shield.weight ?? 0) lbs"
            detailView.leftHeader2.text = "Parry"
            detailView.leftDescription2.text = "+ \(shield.parry ?? 0) to parry"
            detailView.leftHeader3.text = "Notes"
            detailView.leftDescription3.text = shield.notes ?? ""

        }
        
        if let power: PowerModel = object as? PowerModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWPower")
            detailView.typeLabel.text = "Power"
            detailView.nameLabel.text = power.title ?? ""
            detailView.leftHeader1.text = "Range"
            detailView.leftDescription1.text = power.range ?? ""
            detailView.rightHeader1.text = "PP"
            detailView.rightDescription1.text = "\(power.powerPoints ?? 0)"
            detailView.leftHeader2.text = "Rank"
            detailView.leftDescription2.text = power.rank ?? ""
            detailView.leftHeader3.text = "Notes"
            detailView.leftDescription3.text = power.notes ?? ""

            
        }
        if let item: ItemModel = object as? ItemModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWBGreen")
            detailView.typeLabel.text = "Item"
            detailView.nameLabel.text = item.title ?? ""
            detailView.leftHeader1.text = "Notes"
            detailView.leftDescription1.text = item.notes
        }
        
        if let hindrance: HindranceModel = object as? HindranceModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWDry_Planet")
            detailView.typeLabel.text = "Hindrance"
            detailView.nameLabel.text = hindrance.title ?? ""
            detailView.leftHeader1.text = "Level"
            detailView.leftDescription1.text = hindrance.level ?? ""
            detailView.leftHeader2.text = "Summary"
            detailView.leftDescription2.text = hindrance.summary ?? ""
            
        }
        
        if let edge: EdgeModel = object as? EdgeModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWCore_Planet")
            detailView.typeLabel.text = "Edge"
            detailView.nameLabel.text = edge.title ?? ""
            detailView.leftHeader1.text = "Summary"
            detailView.leftDescription1.text = edge.summary ?? ""
        }
        
        if let race: RB_Race = object as? RB_Race {
            let raceImageView: UIImageView = UIImageView(frame: detailView.bannerView.frame)
            raceImageView.contentMode = .scaleAspectFill
            raceImageView.image = image
            detailView.bannerView.addSubview(raceImageView)
            detailView.bannerView.bringSubviewToFront(raceImageView)
            detailView.typeLabel.text = "Race"
            detailView.nameLabel.text = race.title
            detailView.leftHeader1.text = "Description"
            detailView.leftDescription1.text = race.generalDescription
            
        }
        
        if let skill: RB_Skill = object as? RB_Skill {
            
            detailView.bannerView.backgroundColor = UIColor().getColorFromAttribute(attribute: skill.attribute)
            detailView.typeLabel.text = "Skill"
            detailView.nameLabel.text = skill.title ?? ""
            detailView.leftHeader1.text = "Attribute"
            detailView.leftDescription1.text = skill.attribute ?? ""
            detailView.leftHeader2.text = "Summary"
            detailView.leftDescription2.text = skill.summary ?? ""
            
        }
        
        if let condition: ConditionModel = object as? ConditionModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWRed")
            detailView.typeLabel.text = "Condition"
            detailView.nameLabel.text = condition.title ?? ""
            detailView.leftHeader1.text = "Summary"
            detailView.leftDescription1.text = condition.summary ?? ""
        }
        
        if let attribute: AttributeModel = object as? AttributeModel {
            detailView.bannerView.backgroundColor = UIColor().getColorFromAttribute(attribute: attribute.title ?? "")
            detailView.typeLabel.text = "Attribute"
            detailView.nameLabel.text = attribute.title ?? ""
            detailView.leftHeader1.text = "Summary"
            detailView.leftDescription1.text = attribute.summary ?? ""

        }
        
        for label in labelArray {
            if !((label?.text?.count ?? 0) > 0) {
                label?.isHidden = true
            }
        }
        
        self.view.addSubview(detailView)
        self.view.bringSubviewToFront(detailView)
        UIView.animate(withDuration: 0.5) {
            detailView.frame = CGRect(x: 0, y: UIScreen.main.bounds.maxY / 2, width: self.view.frame.width, height: UIScreen.main.bounds.height / 2)
        }
    }
    
}

extension CAGradientLayer {
    
    func apply(angle : Double) {
        let x: Double! = angle / 360.0
        let a = pow(sinf(Float(2.0 * Double.pi * ((x + 0.75) / 2.0))),2.0);
        let b = pow(sinf(Float(2*Double.pi*((x+0.0)/2))),2);
        let c = pow(sinf(Float(2*Double.pi*((x+0.25)/2))),2);
        let d = pow(sinf(Float(2*Double.pi*((x+0.5)/2))),2);
        
        endPoint = CGPoint(x: CGFloat(c),y: CGFloat(d))
        startPoint = CGPoint(x: CGFloat(a),y:CGFloat(b))
    }
    
    
}
