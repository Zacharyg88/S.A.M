//
//  SWMissionDetailViewController.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/28/21.
//

import UIKit

class SWMissionDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var gradientContainerView: UIView!
    @IBOutlet weak var header1Label: UILabel!
    @IBOutlet weak var description1Label: UILabel!
    @IBOutlet weak var header2Label: UILabel!
    @IBOutlet weak var description2Label: UILabel!
    @IBOutlet weak var header3Label: UILabel!
    @IBOutlet weak var description3Label: UILabel!
    @IBOutlet weak var header4Label: UILabel!
    @IBOutlet weak var description4Label: UILabel!

    var headerArray = [UILabel]()
    var descriptionArray = [UILabel]()
    var mission: MissionModel? {
        didSet {
            databaseManager.getImageFromStorage(imageName: mission?.imageURL ?? "") { (image, error) in
                if error != nil {
                    print("There was an error getting the image \(error)")
                }else {
                    self.imageView.image = image
                    let gradient = CAGradientLayer()
                    gradient.colors = [UIColor.clear, UIColor.black]
                    gradient.locations = [0.0, 1.0]
                    gradient.frame = self.gradientContainerView.bounds
                    self.gradientContainerView.layer.insertSublayer(gradient, at: 0)
                }
            }
            self.titleLabel.text = mission?.title
            switch mission?.missionType {
            case "capture":
                typeButton.backgroundColor = UIColor(named: "SWDry_Planet")
                self.typeButton.setTitle("Capture", for: UIControl.State())

            case "steal":
                typeButton.backgroundColor = UIColor(named: "SWGreen")
                self.typeButton.setTitle("Steal", for: UIControl.State())

            case "sabotage":
                typeButton.backgroundColor = UIColor(named: "SWBlue")
                self.typeButton.setTitle("Sabotage", for: UIControl.State())

            default:
                typeButton.backgroundColor = UIColor(named: "SWRed")
                self.typeButton.setTitle("Assassinate", for: UIControl.State())
            }
            self.locationImageView.image = UIImage(named:"icon_" + (mission?.missionLocation ?? ""))
            self.locationLabel.text = mission?.missionLocation
            for i in 1...(mission?.headers?.count ?? 0) {
                let header = headerArray[i - 1]
                let description = descriptionArray[i - 1]
                if let dict: [String: Any] = mission?.headers?[i - 1] {
                    header.isHidden = false
                    header.text = dict["title"] as? String
                    description.isHidden = false
                    description.text = dict["description"] as? String
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        typeButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        typeButton.layer.cornerRadius = typeButton.frame.height / 2
        
        headerArray = [header1Label, header2Label, header3Label, header4Label]
        descriptionArray = [description1Label, description2Label, description3Label, description4Label]
        
        for header in headerArray {
            header.isHidden = true
        }
        for description in descriptionArray {
            description.isHidden = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }


}