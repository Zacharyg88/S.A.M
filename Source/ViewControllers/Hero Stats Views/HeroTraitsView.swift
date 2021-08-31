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
    
    
    var skills: [SkillModel] = [] {
        didSet {
            print(skills)
            
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
            cell.skillTitleLabel.textColor = getColorFromAttribute(attribute: skill.attribute ?? "")
            cell.diceLabel.text = skill.dice?.title
            cell.diceImageView.image = UIImage(named: "icon_" + (skill.dice?.title ?? ""))
            
            if skill.dice?.title == nil || skill.dice?.sides == 0 {
                cell.diceLabelTrailing.constant = 8
                cell.diceImageView.isHidden = true
                cell.diceLabel.text = " - "
            }else {
                cell.diceLabelTrailing.constant = 36
                cell.diceImageView.isHidden = false
            }
            return cell
        }
        
        return UICollectionViewCell()
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
