//
//  SWMissionLogTableViewCell.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/21/21.
//

import UIKit

class SWMissionLogTableViewCell: UITableViewCell {
    
    @IBOutlet weak var voteButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var missionTargetLabel: UILabel!
    @IBOutlet weak var missionDescriptionLabel: UILabel!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var targeLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var loadingLabel: UILabel!

    var userHasVotedForMission: Bool = false
    var mission: MissionModel? {
        didSet {
            let bannerString = (mission?.missionType ?? "") + "_mission_banner"
            
            self.bannerImageView.image = UIImage(named: bannerString)
            if mission?.target != nil {
                self.missionTargetLabel.text = mission?.target
            }else {
                self.missionTargetLabel.isHidden = true
                self.targeLabelTopConstraint.constant = 0
            }
            self.missionDescriptionLabel.text = mission?.missionDetailsShort
            self.locationLabel.text = mission?.missionLocation
            self.locationImageView.image = UIImage(named:"icon_" + (mission?.missionLocation ?? ""))
            self.backgroundImageView.layer.borderColor = UIColor.white.withAlphaComponent(0.7).cgColor
            self.backgroundImageView.layer.borderWidth = 1
            
            self.shadowView.backgroundColor = UIColor.black.withAlphaComponent(0.65)
            
            databaseManager.getImageFromStorage(imageName: mission?.imageURL ?? "") { (image, error) in
                if error != nil {
                    print(error)
                }else {
                    if let bgImage = image {
                        self.backgroundImageView.image = bgImage
                        
                        self.shouldRepeatAnimation = false
                        self.loadingLabel.isHidden = true
                        self.loadingLabel.isUserInteractionEnabled = false
                        
                    }
                }
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        animateLoadingLabel()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var shouldRepeatAnimation: Bool = true
    func animateLoadingLabel() {
        switch loadingLabel.text?.count {
        case 1:
            loadingLabel.text = ".."
        case 2:
            loadingLabel.text = "..."
        default:
            loadingLabel.text = "."
        }
        if shouldRepeatAnimation {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.animateLoadingLabel()
            }
        }
    }
    
    @IBAction func voteTapped(_ sender: Any) {
        if userHasVotedForMission {
            self.voteButton.setImage(UIImage(named: "mission_vote_button"), for: UIControl.State())
        }else {
            self.voteButton.setImage(UIImage(named: "mission_vote_selected"), for: UIControl.State())
        }
        self.userHasVotedForMission = !self.userHasVotedForMission
    }
    
}
