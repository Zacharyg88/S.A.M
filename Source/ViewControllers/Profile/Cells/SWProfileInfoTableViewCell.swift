//
//  SWProfileInfoTableViewCell.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/30/21.
//

import UIKit

class SWProfileInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var DOBLabel: UILabel!

    var user: User?
    var hostVC: SWProfileViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.emailLabel.text = user?.email ?? "Email not Supplied"
        let emailTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(emailTapped))
        emailLabel.addGestureRecognizer(emailTap)
        self.phoneLabel.text = user?.phoneNumber ?? "Phone Number not Supplied"
        let phoneTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(phoneTapped))
        phoneLabel.addGestureRecognizer(phoneTap)
        self.DOBLabel.text = user?.DOB ?? "DOB not Supplied"
        let DOBTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DOBTapped))
        DOBLabel.addGestureRecognizer(DOBTap)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @objc func emailTapped() {
        if user?.email != nil {
            if user?.slug == (userManager.currentUser?.slug ?? "") {
                launchUpdateInfoView()
            }else {
                if let url = URL(string: "mailto:\(user?.email)") {
                    UIApplication.shared.open(url, options: [:]) { done in
                        if done {
                            
                        }
                    }
                }
            }
        }
    }
    
    @objc func phoneTapped() {
        if user?.phoneNumber != nil {
            if user?.slug == (userManager.currentUser?.slug ?? "") {
                launchUpdateInfoView()
            }else {
                if let url = URL(string: "sms:\(user?.phoneNumber)") {
                    UIApplication.shared.open(url, options: [:]) { done in
                        if done {
                            
                        }
                    }
                }
            }
        }
    }
    
    @objc func DOBTapped() {
        if user?.DOB != nil {
            if user?.slug == (userManager.currentUser?.slug ?? "") {
                launchUpdateInfoView()
            }else {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/YYYY"
                if let url = URL(string: "calshow:\(user?.DOB)") {
                    UIApplication.shared.open(url, options: [:]) { done in
                        if done {
                            
                        }
                    }
                }
            }
        }
    }
    
    
    func launchUpdateInfoView() {
        let infoView: UserInfoViewController = UserInfoViewController()
        self.hostVC?.present(infoView, animated: true, completion: {
            
        })
    }
    
}
