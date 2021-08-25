//
//  LoginViewController.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/19/21.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    var emailHasError = false
    var passwordHasError = false
    var isLogin: Bool = false
    var hostVC: LauncherViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.tag = 1
        emailTextField.delegate = self
        emailTextField.keyboardType = .emailAddress
        emailErrorLabel.isHidden = true
        passwordTextField.tag = 2
        passwordTextField.delegate = self
        passwordErrorLabel.isHidden = true
        passwordTextField.isSecureTextEntry = true
        
        loginButton.layer.cornerRadius = 8
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.white.cgColor
        
        view.backgroundColor = UIColor.clear
        containerView.alpha = 0
        containerView.backgroundColor = UIColor.white
        containerView.layer.shadowColor = UIColor.cyan.cgColor
        containerView.layer.shadowOffset = CGSize(width: 8, height: 8)
        containerView.layer.shadowRadius = 8
        containerView.layer.shadowOpacity = 0.75
        containerView.layer.cornerRadius = 8
        
        if isLogin {
            loginButton.setTitle("Sign In", for: UIControl.State())
        }else {
            loginButton.setTitle("Sign Up", for: UIControl.State())
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.shadowView.backgroundColor = UIColor.black.withAlphaComponent(0.75)
            self.containerView.alpha = 1
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        if !(emailTextField.text?.isValidEmail() ?? false) {
            self.emailErrorLabel.text = "Submitted Email is not in the correct format"
            self.emailErrorLabel.isHidden = false
            self.emailHasError = true
        }
        
        if !(passwordTextField.text?.isValidPassword() ?? false) {
            self.passwordErrorLabel.text = "Submitted Password must be at least 7 characters and have no spaces."
            self.passwordErrorLabel.isHidden = false
            self.passwordHasError = true
        }
        
        if !emailHasError && !passwordHasError {
            Auth.auth().fetchSignInMethods(forEmail: emailTextField.text ?? "") { (attempts, error) in
                if attempts?.isEmpty ?? false {
                    self.isLogin = false
                    databaseManager.authenticateUser(email: self.emailTextField.text!, password: self.passwordTextField.text!) {  (user, error) in
                        if error != nil {
                            print(error)
                        }else {
                            print(user)
                            self.launchTabBarController()
                        }
                    }
                }else {
                    self.isLogin = true
                    databaseManager.signInUser(email: self.emailTextField.text!, password: self.passwordTextField.text!) { (success, error) in
                        if error != nil {
                            print(error)
                        }else {
                            self.launchTabBarController()
                        }
                    }
                }
            }
        }
    }
    
    func launchTabBarController() {
        self.dismiss(animated: true)  {
            if userManager.currentUser?.firstName == " " || userManager.currentUser?.firstName == nil  {
                self.hostVC?.launchMoreInfoViewController()
            } else {
                self.hostVC?.launchTabBarController()
            }
        }
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1 {
            if emailHasError {
                self.emailErrorLabel.isHidden = true
                self.emailHasError = false
            }
        }else {
            if passwordHasError {
                self.passwordErrorLabel.isHidden = true
                self.passwordHasError = false
            }
        }
    }
}
