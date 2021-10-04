//
//  SWProfileViewController.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/21/21.
//

import UIKit

class SWProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            print("Header View")
        case 1:
            print("Info Cell")
        case 2:
            print("Heroes Cell")
        case 3:
            print("Party Cell")
        default:
            print("Sign Out")
        }
        return UITableViewCell()
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        let signOutAlert: UIAlertController = UIAlertController(title: "Sign Out?", message: "Are you sure you want to sign out?", preferredStyle: .actionSheet)
        signOutAlert.view.tintColor = UIColor(named: "SWRed")
        let signOutAction: UIAlertAction = UIAlertAction(title: "Sign Out", style: .default) { (action) in
            databaseManager.signOutUser { (success, error) in
                if success {
                    UserDefaults.standard.removeObject(forKey: "CurrentUserSlug")
                    if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                        self.dismiss(animated: true) {
                            appDelegate.loadApp()
                        }
                    }
                }
            }
        }
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        signOutAlert.addAction(signOutAction)
        signOutAlert.addAction(cancelAction)
        self.present(signOutAlert, animated: true, completion: nil)
    }
    
}
