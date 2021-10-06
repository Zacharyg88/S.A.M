//
//  HeroTraitsView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 8/26/21.
//

import Foundation
import UIKit

class HeroTraitsView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //Attribute Outlets
    @IBOutlet weak var agilityLabel: UILabel!
    @IBOutlet weak var agilityDiceLabel: UILabel!
    @IBOutlet weak var agilityDiceImageView: UIImageView!
    
    @IBOutlet weak var smartsLabel: UILabel!
    @IBOutlet weak var smartsDiceLabel: UILabel!
    @IBOutlet weak var smartsDiceImageView: UIImageView!
    
    @IBOutlet weak var spiritLabel: UILabel!
    @IBOutlet weak var spiritDiceLabel: UILabel!
    @IBOutlet weak var spiritDiceImageView: UIImageView!
    
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var strengthDiceLabel: UILabel!
    @IBOutlet weak var strengthDiceImageView: UIImageView!
    
    @IBOutlet weak var vigorLabel: UILabel!
    @IBOutlet weak var vigorDiceLabel: UILabel!
    @IBOutlet weak var vigorDiceImageView: UIImageView!
    
    @IBOutlet weak var dividerView: UIView!
    @IBOutlet weak var skillsCollectionView: UICollectionView!
    
    var globalMod: Int? {
        didSet {
            skillsCollectionView.reloadData()
            setAttributeLabels()
        }
    }
    var globalModIsNegative: Bool = true
    
    var skills: [SkillModel] = []
    var attributes: [AttributeModel] = [] {
        didSet {
            setAttributeLabels()
        }
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadAndShowNib()
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadAndShowNib()
        setupViews()
    }
    
    
    func setupViews() {
        skillsCollectionView.delegate = self
        skillsCollectionView.dataSource = self
        skillsCollectionView.register(UINib(nibName: "HeroSkillsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HeroSkillsCollectionViewCell")
        skillsCollectionView.backgroundColor = .clear
        self.backgroundColor = .clear
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.frame.width / 2) - 5
        return CGSize(width: width, height: 24)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: HeroSkillsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroSkillsCollectionViewCell", for: indexPath) as? HeroSkillsCollectionViewCell {
            
            let skill: SkillModel = skills[indexPath.row]
            cell.skillTitleLabel.text = skill.title
            cell.skillTitleLabel.textColor = UIColor().getColorFromAttribute(attribute: skill.attribute ?? "")
            cell.diceLabel.text = skill.dice?.title
            cell.diceLabel.textColor = UIColor(named: "SWStrength_Vigor")
            if globalMod != nil {
                var modString = ""
                if globalModIsNegative {
                    modString.append(" - ")
                    cell.diceLabel.textColor = .red
                }else {
                    modString.append(" + ")
                    cell.diceLabel.textColor = UIColor(named: "SWGreen")
                }
                modString.append("\(globalMod ?? 0)")
                cell.diceLabel.text?.append(modString)
            }
            cell.diceImageView.image = UIImage(named: "icon_" + (skill.dice?.title ?? ""))
            
            if skill.dice?.title == nil || skill.dice?.sides == 0 {
                cell.diceImageView.isHidden = true
                cell.diceLabel.text = " - "
            }else {
                cell.diceImageView.isHidden = false
            }
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
    func setAttributeLabels() {
        var stringSuffix = ""
        var textColor = UIColor(named: "SWStrength_Vigor")
        if globalMod != nil {
            if globalModIsNegative {
                stringSuffix.append(" - \(globalMod ?? 0)")
                textColor = UIColor.red
            }else {
                stringSuffix.append(" + \(globalMod ?? 0)")
                textColor = UIColor(named: "SWGreen")
            }
        }

        for attribute in attributes {
            switch attribute.title {
            case "Agility":
                self.agilityDiceLabel.text = (attribute.dice?.title ?? "") + stringSuffix
                self.agilityDiceLabel.textColor = textColor
                self.agilityDiceImageView.image = UIImage(named: "icon_\(attribute.dice?.title ?? "")")
            case "Smarts":
                self.smartsDiceLabel.text = (attribute.dice?.title ?? "") + stringSuffix
                self.smartsDiceLabel.textColor = textColor
                self.smartsDiceImageView.image = UIImage(named: "icon_\(attribute.dice?.title ?? "")")
            case "Spirit":
                self.spiritDiceLabel.text = (attribute.dice?.title ?? "") + stringSuffix
                self.spiritDiceLabel.textColor = textColor
                self.spiritDiceImageView.image = UIImage(named: "icon_\(attribute.dice?.title ?? "")")
            case "Strength":
                self.strengthDiceLabel.text = (attribute.dice?.title ?? "") + stringSuffix
                self.strengthDiceLabel.textColor = textColor
                self.strengthDiceImageView.image = UIImage(named: "icon_\(attribute.dice?.title ?? "")")
            default:
                self.vigorDiceLabel.text = (attribute.dice?.title ?? "") + stringSuffix
                self.vigorDiceLabel.textColor = textColor
                self.vigorDiceImageView.image = UIImage(named: "icon_\(attribute.dice?.title ?? "")")
            }
        }
    }
    
}
