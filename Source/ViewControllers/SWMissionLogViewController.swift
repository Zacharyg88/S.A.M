//
//  SWMissionLogViewController.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/21/21.
//

import UIKit

class SWMissionLogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView?
    var missions: [MissionModel] = [] {
        didSet {
            self.tableView?.reloadData()
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
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: SWMissionLogTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SWMissionLogTableViewCell", for: indexPath) as? SWMissionLogTableViewCell {
            cell.mission = missions[indexPath.row]
            
            return cell
        }
        return UITableViewCell()
    }
    
    

}
