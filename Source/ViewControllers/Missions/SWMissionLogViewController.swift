//
//  SWMissionLogViewController.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/21/21.
//

import UIKit

class SWMissionLogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var missionsButton: UIButton!
    @IBOutlet weak var notesButton: UIButton!
    @IBOutlet weak var notesTableView: UITableView!
    var isMissionView: Bool = true {
        didSet {
            if isMissionView {
                notesTableView.isHidden = true
                tableView?.isHidden = false
                missionsButton.setTitleColor(UIColor.white, for: UIControl.State())
                missionsButton.backgroundColor = UIColor(named: "SWBacking")
                notesButton.setTitleColor(UIColor(named: "SWStrength_Vigor"), for: UIControl.State())
                notesButton.backgroundColor = UIColor(named: "SWBackground")
            }else {
                tableView?.isHidden = true
                notesTableView.isHidden = false
                notesButton.setTitleColor(UIColor.white, for: UIControl.State())
                notesButton.backgroundColor = UIColor(named: "SWBacking")
                missionsButton.setTitleColor(UIColor(named: "SWStrength_Vigor"), for: UIControl.State())
                missionsButton.backgroundColor = UIColor(named: "SWBackground")
            }
        }
    }
    
    var missions: [MissionModel] = [] {
        didSet {
            self.tableView?.reloadData()
        }
    }
    var notes: [Any] = [] {
        didSet {
            self.notesTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        databaseManager.getAllMissionsFromDatabase { (missions, error) in
            if error != nil {
                print("Unable to get missions from database")
            }else {
                if let missionArray = missions {
                    self.missions = missionArray
                }
            }
        }
        tableView?.register(UINib(nibName: "SWMissionLogTableViewCell", bundle: nil), forCellReuseIdentifier: "SWMissionLogTableViewCell")
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tag = 0
        
        notesTableView.delegate = self
        notesTableView.dataSource = self
        notesTableView.tag = 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return missions.count
        }else {
            return notes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: SWMissionLogTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SWMissionLogTableViewCell", for: indexPath) as? SWMissionLogTableViewCell {
            cell.mission = missions[indexPath.row]
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let missionDetailVC: SWMissionDetailViewController = SWMissionDetailViewController()
        _ = missionDetailVC.view
        missionDetailVC.mission = missions[indexPath.row]
        self.present(missionDetailVC, animated: true)
    }
    
    @IBAction func missionsTapped(_ sender: Any) {
        self.isMissionView = true
    }
    
    @IBAction func notesTapped(_ sender: Any) {
        self.isMissionView = false
    }
    

}
