//
//  SWProfileSignOutTableViewCell.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/30/21.
//

import UIKit

class SWProfileSignOutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var signOutButton: UIButton!
    var hostVC: SWProfileViewController?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        hostVC?.signOutTapped(self)
    }
    
    
}
