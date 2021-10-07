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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SWProfileHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "SWProfileHeaderTableViewCell")
        tableView.register(UINib(nibName: "SWProfileInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "SWProfileInfoTableViewCell")
        tableView.register(UINib(nibName: "SWProfileHeroesTableViewCell", bundle: nil), forCellReuseIdentifier: "SWProfileHeroesTableViewCell")
        tableView.register(UINib(nibName: "SWProfilePartyTableViewCell", bundle: nil), forCellReuseIdentifier: "SWProfilePartyTableViewCell")
        tableView.register(UINib(nibName: "SWProfileSignOutTableViewCell", bundle: nil), forCellReuseIdentifier: "SWProfileSignOutTableViewCell")

        tableView.tableFooterView = UIView()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 200
        case 1:
            return 120
        case 2, 3:
            return 160
        default:
            return 75
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            print("Header View")
            if let cell: SWProfileHeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SWProfileHeaderTableViewCell", for: indexPath) as? SWProfileHeaderTableViewCell {
                
                return cell
            }
        case 1:
            print("Info Cell")
            if let cell: SWProfileInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SWProfileInfoTableViewCell", for: indexPath) as? SWProfileInfoTableViewCell {
                
                return cell
            }
        case 2:
            print("Heroes Cell")
            if let cell: SWProfileHeroesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SWProfileHeroesTableViewCell", for: indexPath) as? SWProfileHeroesTableViewCell {
                
                return cell
            }
        case 3:
            print("Party Cell")
            if let cell: SWProfilePartyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SWProfilePartyTableViewCell", for: indexPath) as? SWProfilePartyTableViewCell {
                
                return cell
            }
        default:
            print("Sign Out")
            if let cell: SWProfileSignOutTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SWProfileSignOutTableViewCell", for: indexPath) as? SWProfileSignOutTableViewCell {
                
                return cell
            }
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
