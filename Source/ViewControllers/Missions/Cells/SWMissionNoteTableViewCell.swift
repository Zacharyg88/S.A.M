//
//  SWMissionNoteTableViewCell.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 10/19/21.
//

import UIKit

class SWMissionNoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var noteTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
