//
//  HeroCreationHindranceTableViewCell.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/4/21.
//

import UIKit

class HeroCreationHindranceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var disclosureImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
