//
//  HeroCreationSkillsCollectionViewCell.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/5/21.
//

import UIKit

class HeroCreationSkillsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var skillLabel: UILabel!
    @IBOutlet weak var diceLabel: UILabel!
    @IBOutlet weak var diceImageView: UIImageView!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!

    var hostVC: HeroCreationSkillsView?
    var skillName: String = "" {
        didSet {
            self.skillLabel.text = skillName
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func minusTapped(_ sender: Any) {
        hostVC?.subtractPoint(skillName: skillName)
        
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        hostVC?.spendPoint(skillName: skillName)
    }
}
