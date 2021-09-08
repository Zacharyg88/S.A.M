//
//  SWHeroEdgesTableViewCell.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/7/21.
//

import UIKit

class SWHeroEdgesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var edgeLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
