//
//  SWProfileHeaderTableViewCell.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/30/21.
//

import UIKit

class SWProfileHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor(named: "SWBackground")?.cgColor, UIColor(named: "SWBlue")?.cgColor, UIColor.init(named: "SWBackground")?.cgColor]
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.frame = bannerView.bounds
        bannerView.layer.addSublayer(gradient)
        
        let user = userManager.currentUser
        profileImageView.image = UIImage(systemName: "plus")
        profileImageView.tintColor = UIColor.white
        profileImageView.layer.cornerRadius = 8
        profileImageView.layer.borderWidth = 1.5
        profileImageView.layer.borderColor = UIColor.white.cgColor
        if user?.profile_image_name != nil {
            databaseManager.getImageFromStorage(imageName: user?.profile_image_name ?? "") { image, error in
                if error != nil {
                    print("There was an error getting the image \(error)")
                }else {
                    self.profileImageView.image = image
                }
            }
        }
        usernameLabel.text = user?.username ?? ""
        fullNameLabel.text = (user?.firstName ?? "") + " " + (user?.lastName ?? "")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
