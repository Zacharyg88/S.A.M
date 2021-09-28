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
    @IBOutlet weak var missionTargetLabel: UILabel!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var missionTypeButton: UIButton!
    
    @IBOutlet weak var loadingLabel: UILabel!

    var userHasVotedForMission: Bool = false {
        didSet {
            if oldValue != userHasVotedForMission {
                databaseManager.postMissionVote(mission: mission ?? MissionModel()) { (success, error) in
                    print(success, error)
                }
            }
        }
    }
    var mission: MissionModel? {
        didSet {
            self.missionTargetLabel.text = mission?.title ?? ""
            self.missionTypeButton.setTitle(mission?.missionType ?? "", for: UIControl.State())
            switch mission?.missionType {
            case "capture":
                missionTypeButton.backgroundColor = UIColor(named: "SWDry_Planet")
                self.missionTypeButton.setTitle("Capture", for: UIControl.State())

            case "steal":
                missionTypeButton.backgroundColor = UIColor(named: "SWGreen")
                self.missionTypeButton.setTitle("Steal", for: UIControl.State())

            case "sabotage":
                missionTypeButton.backgroundColor = UIColor(named: "SWBlue")
                self.missionTypeButton.setTitle("Sabotage", for: UIControl.State())

            default:
                missionTypeButton.backgroundColor = UIColor(named: "SWRed")
                self.missionTypeButton.setTitle("Assassinate", for: UIControl.State())

            }
            
            missionTypeButton.layer.cornerRadius = missionTypeButton.frame.height / 2
            missionTypeButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
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
            if mission?.votes?.contains(userManager.currentUser?.slug ?? "") ?? false {
                voteButton.setImage(UIImage(named: "icon_mission_voted"), for: UIControl.State())
                userHasVotedForMission = true
            }else {
                voteButton.setImage(UIImage(named: "icon_mission_vote"), for: UIControl.State())
                userHasVotedForMission = false
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
        if !userHasVotedForMission {
            self.voteButton.setImage(UIImage(named: "icon_mission_voted"), for: UIControl.State())
            self.mission?.votes?.append(userManager.currentUser?.slug ?? "")
        }else {
            self.voteButton.setImage(UIImage(named: "icon_mission_vote"), for: UIControl.State())
            if let index = self.mission?.votes?.firstIndex(of: userManager.currentUser?.slug ?? "") {
                self.mission?.votes?.remove(at: index)
            }
        }
        self.userHasVotedForMission = !userHasVotedForMission
    }
    
}
