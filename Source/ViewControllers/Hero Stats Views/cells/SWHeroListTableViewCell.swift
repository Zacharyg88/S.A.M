//
//  SWHeroListTableViewCell.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/1/21.
//

import UIKit

class SWHeroListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroLevelLabel: UILabel!
    @IBOutlet weak var heroContainerView: UIView!

    var hero: HeroModel? {
        didSet {
            databaseManager.getImageFromStorage(imageName: hero?.imageName ?? "") { (image, error) in
                if error != nil {
                    print("There was an error getting the hero image from the server \(error)")
                }else {
                    self.heroImageView.image = image
                }
            }
            heroNameLabel.text = hero?.heroName
            heroLevelLabel.text = hero?.getLevelString()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        heroImageView.layer.cornerRadius = heroImageView.frame.height / 2
        heroImageView.layer.borderColor = UIColor(named: "SWBlue")?.cgColor
        heroImageView.layer.borderWidth = 2
        heroContainerView.layer.cornerRadius = heroContainerView.frame.height / 2
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
