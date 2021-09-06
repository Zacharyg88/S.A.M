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
    var rulebookSkills = ruleBook.skills.skills
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
    
    
    
}
