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
    
    
    func showDetailForItem(object: Any) {
        var detailView: HeroObjectDetailsView = HeroObjectDetailsView(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY, width: self.view.frame.width, height: UIScreen.main.bounds.height / 2))
        
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
            detailView.rightHeader2.isHidden = true
            detailView.rightDescription2.isHidden = true
            detailView.leftHeader3.text = "Notes"
            detailView.leftDescription3.text = armor.notes ?? ""
            detailView.rightHeader3.isHidden = true
            detailView.rightDescription3.isHidden = true
            detailView.leftHeader4.isHidden = true
            detailView.leftDescription4.isHidden = true
            
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
            detailView.rightHeader2.isHidden = true
            detailView.rightDescription2.isHidden = true
            detailView.leftHeader3.text = "Notes"
            detailView.leftDescription3.text = shield.notes ?? ""
            detailView.rightHeader3.isHidden = true
            detailView.rightDescription3.isHidden = true
            detailView.leftHeader4.isHidden = true
            detailView.leftDescription4.isHidden = true
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
            detailView.rightHeader2.isHidden = true
            detailView.rightDescription2.isHidden = true
            detailView.leftHeader3.text = "Notes"
            detailView.leftDescription3.text = power.notes ?? ""
            detailView.rightHeader3.isHidden = true
            detailView.rightDescription3.isHidden = true
            detailView.leftHeader4.isHidden = true
            detailView.leftDescription4.isHidden = true
            
        }
        if let item: ItemModel = object as? ItemModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWBGreen")
            detailView.typeLabel.text = "Item"
            detailView.nameLabel.text = item.title ?? ""
            detailView.leftHeader1.text = "Notes"
            detailView.leftDescription1.text = item.notes
            detailView.rightHeader1.isHidden = true
            detailView.rightDescription1.isHidden = true
            detailView.leftHeader2.isHidden = true
            detailView.leftDescription2.isHidden = true
            detailView.rightHeader2.isHidden = true
            detailView.rightDescription2.isHidden = true
            detailView.leftHeader3.isHidden = true
            detailView.leftDescription3.isHidden = true
            detailView.rightHeader3.isHidden = true
            detailView.rightDescription3.isHidden = true
            detailView.leftHeader4.isHidden = true
            detailView.leftDescription4.isHidden = true
        }
        
        if let hindrance: HindranceModel = object as? HindranceModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWDry_Planet")
            detailView.typeLabel.text = "Hindrance"
            detailView.nameLabel.text = hindrance.title ?? ""
            detailView.leftHeader1.text = "Level"
            detailView.leftDescription1.text = hindrance.level ?? ""
            detailView.leftHeader2.text = "Summary"
            detailView.leftDescription2.text = hindrance.summary ?? ""
            
            detailView.rightHeader1.isHidden = true
            detailView.rightDescription1.isHidden = true
            detailView.rightHeader2.isHidden = true
            detailView.rightDescription2.isHidden = true
            detailView.leftHeader3.isHidden = true
            detailView.leftDescription3.isHidden = true
            detailView.rightHeader3.isHidden = true
            detailView.rightDescription3.isHidden = true
            detailView.leftHeader4.isHidden = true
            detailView.leftDescription4.isHidden = true
        }
        
        if let edge: EdgeModel = object as? EdgeModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWCore_Planet")
            detailView.typeLabel.text = "Edge"
            detailView.nameLabel.text = edge.title ?? ""
            detailView.leftHeader1.text = "Summary"
            detailView.leftDescription1.text = edge.summary ?? ""
            
            detailView.leftHeader2.isHidden = true
            detailView.leftDescription2.isHidden = true
            detailView.rightHeader1.isHidden = true
            detailView.rightDescription1.isHidden = true
            detailView.rightHeader2.isHidden = true
            detailView.rightDescription2.isHidden = true
            detailView.leftHeader3.isHidden = true
            detailView.leftDescription3.isHidden = true
            detailView.rightHeader3.isHidden = true
            detailView.rightDescription3.isHidden = true
            detailView.leftHeader4.isHidden = true
            detailView.leftDescription4.isHidden = true
        }
        
        self.view.addSubview(detailView)
        self.view.bringSubviewToFront(detailView)
        UIView.animate(withDuration: 0.5) {
            detailView.frame = CGRect(x: 0, y: UIScreen.main.bounds.maxY / 2, width: self.view.frame.width, height: UIScreen.main.bounds.height / 2)
        }
    }
    
}
