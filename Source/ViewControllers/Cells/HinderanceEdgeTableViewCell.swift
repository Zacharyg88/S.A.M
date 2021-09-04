//
//  HinderanceEdgeTableViewCell.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 8/30/21.
//

import UIKit

class HinderanceEdgeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var hinderanceStrengthLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
