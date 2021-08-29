//
//  HeroSkillsCollectionViewCell.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 8/27/21.
//

import UIKit

class HeroSkillsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var skillTitleLabel: UILabel!
    @IBOutlet weak var diceLabel: UILabel!
    @IBOutlet weak var diceImageView: UIImageView!
    @IBOutlet weak var diceLabelTrailing: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
