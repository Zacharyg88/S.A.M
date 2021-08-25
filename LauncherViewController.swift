//
//  ViewController.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/19/21.
//

import UIKit
import FirebaseAuth


class LauncherViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var terminalLabel: UILabel!
    var loginViewController: LoginViewController?
    var loginStringArray = ">> PLEASE LOGIN TO CONTINUE"
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
        }
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        let loginViewController: LoginViewController = LoginViewController()
        _ = loginViewController.view
        loginViewController.view.frame = UIScreen.main.bounds
        loginViewController.shadowView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissLoginView)))
        loginViewController.hostVC = self
        loginViewController.modalPresentationStyle = .fullScreen
        self.loginViewController = loginViewController
        self.view.addSubview(loginViewController.view ?? UIView())
        self.view.bringSubviewToFront(loginViewController.view ?? UIView())
        
        
        //self.present(loginViewController, animated: true, completion: nil)
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
        let tabBar = SWTabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        self.present(tabBar, animated: true, completion: nil)
    }
    
}

