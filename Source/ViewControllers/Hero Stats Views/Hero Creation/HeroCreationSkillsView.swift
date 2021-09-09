//
//  HeroCreationSkillsView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/3/21.
//

import Foundation
import UIKit

class HeroCreationSkillsView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var pointsRemainingLabel: UILabel!
    @IBOutlet weak var skillsCollectionView: UICollectionView!
    
    var allSkills: [SkillModel] = []
    var hostVC: SWHeroCreationViewController?
    var diceDenoms = [4,6,8,10,12]
    var rulebookSkills = ruleBook.skills.skills
    var availablePoints: Int = 12 {
        didSet {
            self.pointsRemainingLabel.text = "\(availablePoints)"
        }
    }
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
        skillsCollectionView.delegate = self
        skillsCollectionView.dataSource = self
        skillsCollectionView.register(UINib(nibName: "HeroCreationSkillsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HeroCreationSkillsCollectionViewCell")
        self.availablePoints = 12
        for skill in ruleBook.skills.skills {
            var newSkill = SkillModel()
            newSkill.title = skill.title
            newSkill.attribute = skill.attribute
            if skill.title.contains("*") {
                var dice = DiceModel()
                dice.sides = 4
                dice.title = "d4"
                newSkill.dice = dice
            }
            allSkills.append(newSkill)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rulebookSkills.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: HeroCreationSkillsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCreationSkillsCollectionViewCell", for: indexPath) as? HeroCreationSkillsCollectionViewCell {
            _ = cell.contentView
            let skill: SkillModel = allSkills[indexPath.row]
            cell.skillName = skill.title ?? ""
            if skill.attribute != "Strength" && skill.attribute != "Vigor" {
                let colorString: String = "SW\(skill.attribute)"
                cell.skillLabel.textColor = UIColor(named: colorString)
            }else {
                cell.skillLabel.textColor = UIColor(named: "SWStrength_Vigor")
            }
            cell.hostVC = self
            return cell
        }
        return UICollectionViewCell()
    }
   
    func spendPoint(skillName: String) {
        for skill in allSkills {
            if skill.title == skillName {
                if skill.dice != nil {
                    let diceIndex = diceDenoms.firstIndex(of: skill.dice?.sides ?? 0)
                    let userAttributes = hostVC?.newHero.attributes
                    if skill.dice?.sides ?? 0 < 12 {
                        skill.dice?.sides = diceDenoms[(diceIndex ?? 0) + 1]
                        for attribute in userAttributes ?? [AttributeModel]() {
                            if attribute.title == skill.attribute {
                                if (skill.dice?.sides ?? 0) > (attribute.dice?.sides ?? 0) {
                                    self.availablePoints -= 2
                                }else {
                                    self.availablePoints -= 1
                                }
                            }
                        }
                    }
                }else {
                    let newDice = DiceModel()
                    newDice.title = "d4"
                    newDice.sides = 4
                    skill.dice = newDice
                    availablePoints -= 1
                }
            }
        }
    }
    
    func subtractPoint(skillName: String) {
        for skill in allSkills {
            if skill.title == skillName {
                if (skill.dice?.sides ?? 0) != 4 {
                    let diceIndex = diceDenoms.firstIndex(of: skill.dice?.sides ?? 0)
                    let userAttributes = hostVC?.newHero.attributes
                    if skill.dice?.sides ?? 0 < 12 {
                        for attribute in userAttributes ?? [AttributeModel]() {
                            if attribute.title == skill.attribute {
                                if (skill.dice?.sides ?? 0) > (attribute.dice?.sides ?? 0) {
                                    self.availablePoints += 2
                                }else {
                                    self.availablePoints += 1
                                }
                            }
                        }
                    }
                    skill.dice?.sides = diceDenoms[(diceIndex ?? 0) - 1]
                }else {
                    skill.dice = nil
                    self.availablePoints += 1
                }
            }
        }
    }
    
    
}
