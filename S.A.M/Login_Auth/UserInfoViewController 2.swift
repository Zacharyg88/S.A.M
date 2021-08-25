//
//  UserInfoViewController.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/20/21.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!

    var hasEnteredFirstName: Bool = false
    var hasEnteredLastName: Bool = false
    var hasEnteredPhoneNumber: Bool = false
    var hostVC: LauncherViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.isUserInteractionEnabled = false
        submitButton.alpha = 0.5
        firstNameTextField.addTarget(self, action: #selector(self.textFieldTextDidChange), for: .editingChanged)
        firstNameTextField.tag = 0
        lastNameTextField.addTarget(self, action: #selector(self.textFieldTextDidChange), for: .editingChanged)
        lastNameTextField.tag = 1
        phoneNumberTextField.addTarget(self, action: #selector(self.textFieldTextDidChange), for: .editingChanged)
        phoneNumberTextField.tag = 2
        

    }
    
    @objc func textFieldTextDidChange(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            print("firstName")
            if (textField.text?.count ?? 0) > 1 {
                hasEnteredFirstName = true
            }
        case 1:
            print("lastName")
            if (textField.text?.count ?? 0) > 1 {
                hasEnteredLastName = true
            }
        default:
            print("phonenumber")
            if (textField.text?.count == 10) {
                hasEnteredPhoneNumber = true
            }
        }
        
        if hasEnteredFirstName && hasEnteredLastName {
            submitButton.isUserInteractionEnabled = true
            submitButton.alpha = 1
        }
    }
    
    
    @IBAction func submitTapped(_ sender: Any) {
        if let user = userManager.currentUser {
            user.firstName = firstNameTextField.text ?? ""
            user.lastName = lastNameTextField.text ?? ""
            user.phoneNumber = phoneNumberTextField.text ?? ""
            databaseManager.updateUserInDataBase(user: userManager.currentUser!) { (success, error) in
                if error != nil {
                    print(error)
                }else {
                    self.dismiss(animated: true) {
                        self.hostVC?.launchTabBarController()
                    }
                }
            }
        }
    }
}
