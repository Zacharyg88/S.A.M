//
//  ViewController.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/19/21.
//

import UIKit
import FirebaseAuth


class LauncherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var terminalLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!

    
    var emailHasError: Bool  = false
    var passwordHasError: Bool = false
    var loginViewController: LoginViewController?
    var loginStringArray = ">> PLEASE VERIFY YOUR CREDENTIALS..."
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginButton.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if userManager.currentUser != nil {
            if userManager.currentUser?.firstName == nil || userManager.currentUser?.firstName == "" {
                self.launchMoreInfoViewController()
            }else {
                self.launchTabBarController()
            }
        }else {
            UIView.animate(withDuration: 0.5) {
                self.loginButton.alpha = 1
                self.terminalLabel.text = ""
                self.loopAnimateTerminalLabel()
            } completion: { (done) in
                
            }

        }
        usernameTextField.tag = 1
        usernameTextField.delegate = self
        usernameTextField.addTarget(self, action: #selector(textFieldTextDidChange(_:)), for: .editingChanged)
        usernameTextField.keyboardType = .emailAddress
        passwordTextField.delegate = self
        passwordTextField.addTarget(self, action: #selector(textFieldTextDidChange(_:)), for: .editingChanged)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.tag = 0
        
        createAccountButton.layer.borderWidth = 1
        createAccountButton.layer.borderColor = UIColor.white.cgColor
        createAccountButton.layer.shadowColor = UIColor.white.cgColor
        createAccountButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        createAccountButton.layer.shadowRadius = 8
        createAccountButton.layer.shadowOpacity = 0.8
        
        usernameTextField.alpha = 0
        emailErrorLabel.isHidden = true
        passwordTextField.alpha = 0
        passwordErrorLabel.isHidden = true
        createAccountButton.alpha = 0
        loginButton.alpha = 0
        
    }
    var loopCount: Int = 0
    func loopAnimateTerminalLabel() {
        var characterArray: [Character] = []
        for i in loginStringArray {
            characterArray.append(i)
        }
        if loopCount < characterArray.count {
            self.terminalLabel.text = (self.terminalLabel.text ?? "") + "\(characterArray[loopCount])"
            loopCount += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.07) {
                self.loopAnimateTerminalLabel()
            }
        }else {
            UIView.animate(withDuration: 0.3) {
                self.usernameTextField.alpha = 1
                self.passwordTextField.alpha = 1
                self.createAccountButton.alpha = 1
                self.loginButton.alpha = 1
            }
        }
    }
    
    
    @IBAction func submitTapped(_ sender: Any) {
        if !(usernameTextField.text?.isValidEmail() ?? false) {
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
            Auth.auth().fetchSignInMethods(forEmail: usernameTextField.text ?? "") { (attempts, error) in
                if attempts?.isEmpty ?? false || attempts == nil {
                    databaseManager.authenticateUser(email: self.usernameTextField.text!, password: self.passwordTextField.text!) {  (user, error) in
                        if error != nil {
                            print(error)
                        }else {
                            print(user)
                            self.launchTabBarController()
                        }
                    }
                }else {
                    databaseManager.signInUser(email: self.usernameTextField.text!, password: self.passwordTextField.text!) { (success, error) in
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
    @objc func textFieldTextDidChange(_ textField: UITextField) {
        if textField.tag == 1 {
            if textField.text == "Username" {
                textField.text = ""
            }
            if emailHasError {
                self.emailErrorLabel.isHidden = true
                self.emailHasError = false
            }
        }else {
            if textField.text == "Password" {
                textField.text = ""
            }
            if passwordHasError {
                self.passwordErrorLabel.isHidden = true
                self.passwordHasError = false
            }
        }
    }
    
    
    @IBAction func createAccount(_ sender: Any) {
        self.submitTapped(self)
    }
    
    @objc func dismissLoginView() {
        self.loginViewController?.view.removeFromSuperview()
        self.loginViewController?.view.willMove(toSuperview: nil)
    }
    
    func launchMoreInfoViewController() {
        let infoVC: UserInfoViewController = UserInfoViewController()
        infoVC.hostVC = self
        self.present(infoVC, animated: true, completion: nil)
    }
    
    func launchTabBarController() {
        let tabBarController: SWTabBarControllerViewController = SWTabBarControllerViewController()
        tabBarController.modalPresentationStyle = .overCurrentContext
        self.present(tabBarController, animated: true, completion: nil)
    }
    
}

