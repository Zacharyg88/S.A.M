//
//  SWRulesViewController.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/21/21.
//

import UIKit

class SWRulesViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var attributesResults: [AttributeModel]?
    var conditionResults: [ConditionModel]?
    var edgesResults: [EdgeModel]?
    var hindranceResults: [HindranceModel]?
    var raceResults: [RB_Race]?
    var skillResults: [RB_Skill]?
    var expandedSections: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SWRulebookEntryTableViewCell", bundle: nil), forCellReuseIdentifier: "SWRulebookEntryTableViewCell")
        clearSearch()
        // Do any additional setup after loading the view.
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            clearSearch()
        }else {
            
            conditionResults = ruleBook.conditions.conditions.filter { (condition) -> Bool in
                if condition.title?.contains(searchText) ?? false {
                    return true
                }else {
                    return false
                }
            }
            var allEdgeResults = ruleBook.edges.Power_Edges?.edges.filter({ (edge) -> Bool in
                if edge.title?.contains(searchText) ?? false {
                    return true
                }else {
                    return false
                }
            })
            allEdgeResults?.append(contentsOf: ruleBook.edges.Weird_Edges?.edges.filter({ (edge) -> Bool in
                if edge.title?.contains(searchText) ?? false {
                    return true
                }else {
                    return false
                }
            }) ?? [EdgeModel]())
            
            allEdgeResults?.append(contentsOf: ruleBook.edges.Combat_Edges?.edges.filter({ (edge) -> Bool in
                if edge.title?.contains(searchText) ?? false {
                    return true
                }else {
                    return false
                }
            }) ?? [EdgeModel]())
            
            allEdgeResults?.append(contentsOf: ruleBook.edges.Social_Edges?.edges.filter({ (edge) -> Bool in
                if edge.title?.contains(searchText) ?? false {
                    return true
                }else {
                    return false
                }
            }) ?? [EdgeModel]())
            
            allEdgeResults?.append(contentsOf: ruleBook.edges.Legendary_Edges?.edges.filter({ (edge) -> Bool in
                if edge.title?.contains(searchText) ?? false {
                    return true
                }else {
                    return false
                }
            }) ?? [EdgeModel]())
            allEdgeResults?.append(contentsOf: ruleBook.edges.Background_Edges?.edges.filter({ (edge) -> Bool in
                if edge.title?.contains(searchText) ?? false {
                    return true
                }else {
                    return false
                }
            }) ?? [EdgeModel]())
            
            allEdgeResults?.append(contentsOf: ruleBook.edges.Leadership_Edges?.edges.filter({ (edge) -> Bool in
                if edge.title?.contains(searchText) ?? false {
                    return true
                }else {
                    return false
                }
            }) ?? [EdgeModel]())
            
            allEdgeResults?.append(contentsOf: ruleBook.edges.Professional_Edges?.edges.filter({ (edge) -> Bool in
                if edge.title?.contains(searchText) ?? false {
                    return true
                }else {
                    return false
                }
            }) ?? [EdgeModel]())
            
            edgesResults = allEdgeResults
            
            hindranceResults = ruleBook.hinderances.hinderances?.filter({ (hindrance) -> Bool in
                if hindrance.title?.contains(searchText) ?? false {
                    return true
                }else {
                    return false
                }
            })
            
            raceResults = ruleBook.races.racesArray.filter({ (race) -> Bool in
                if race.title?.contains(searchText) ?? false {
                    return true
                }else {
                    return false
                }
            })
            
            skillResults = ruleBook.skills.skills.filter({ (skill) -> Bool in
                if skill.title.contains(searchText) {
                    return true
                }else {
                    return false
                }
            })
            tableView.reloadData()
        }
        
    }
    
    
    
    func clearSearch() {
        self.conditionResults = ruleBook.conditions.conditions
        var allEdges: [EdgeModel] = []
        allEdges.append(contentsOf: ruleBook.edges.Background_Edges?.edges ?? [EdgeModel]())
        allEdges.append(contentsOf: ruleBook.edges.Combat_Edges?.edges ?? [EdgeModel]())
        allEdges.append(contentsOf: ruleBook.edges.Professional_Edges?.edges ?? [EdgeModel]())
        allEdges.append(contentsOf: ruleBook.edges.Power_Edges?.edges ?? [EdgeModel]())
        allEdges.append(contentsOf: ruleBook.edges.Social_Edges?.edges ?? [EdgeModel]())
        allEdges.append(contentsOf: ruleBook.edges.Weird_Edges?.edges ?? [EdgeModel]())
        allEdges.append(contentsOf: ruleBook.edges.Legendary_Edges?.edges ?? [EdgeModel]())
        self.edgesResults = allEdges
        self.hindranceResults = ruleBook.hinderances.hinderances
        self.raceResults = ruleBook.races.racesArray
        self.skillResults = ruleBook.skills.skills
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        let headerView: SWRulebookHeaderView = SWRulebookHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
        switch section {
        case 0:
            headerView.titleLabel.text = "Attributes"
        case 1:
            headerView.titleLabel.text = "Conditions"
        case 2:
            headerView.titleLabel.text = "Edges"
        case 3:
            headerView.titleLabel.text = "Hindrances"
        case 4:
            headerView.titleLabel.text = "Races"
        case 5:
            headerView.titleLabel.text = "Skills"
        default:
            headerView.titleLabel.text = "Open Rulebook PDF"
        }
        if self.expandedSections.contains(section) {
            headerView.disclosureButton.setImage(UIImage(named: "icon_arrow_up"), for: UIControl.State())
        }else {
            headerView.disclosureButton.setImage(UIImage(named: "icon_arrow_down"), for: UIControl.State())
        }
        
        if section == 6 {
            headerView.disclosureButton.setImage(UIImage(systemName: "doc.text"), for: UIControl.State())
        }
        var gradient = CAGradientLayer()
        gradient.locations = [0.0, 1.0]
        gradient.colors = [UIColor.clear.cgColor, UIColor(named: "SWStrength_Vigor")?.cgColor]
        gradient.frame = headerView.frame
        headerView.layer.addSublayer(gradient)
        headerView.disclosureButton.tag = section
        headerView.disclosureButton.addTarget(self, action: #selector(toggleSectionExpansion(_:)), for: .touchUpInside)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    @objc func toggleSectionExpansion(_ sender: UIButton) {
        if sender.tag != 6 {
            if self.expandedSections.contains(sender.tag ) {
                self.expandedSections.remove(at: self.expandedSections.firstIndex(of: sender.tag ) ?? 0)
            }else {
                self.expandedSections.append(sender.tag )
            }
            self.tableView.reloadSections([sender.tag ], with: .automatic)
        }else {
            if let url: URL = URL(string: "https://www.notion.so/fikkert/Savage-Worlds-Adventure-Edition-b0dba53b4951491aa5a86620bf2fcb5a") {
                UIApplication.shared.open(url, options: [:]) { (done) in
                    print("Opened Notion")
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if expandedSections.contains(section) {
            switch section {
            case 0:
                return attributesResults?.count ?? 0
            case 1:
                return conditionResults?.count ?? 0
            case 2:
                return edgesResults?.count ?? 0
            case 3:
                return hindranceResults?.count ?? 0
            case 4:
                return raceResults?.count ?? 0
            case 5:
                return skillResults?.count ?? 0
            default:
                return 0
            }
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: SWRulebookEntryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SWRulebookEntryTableViewCell", for: indexPath) as? SWRulebookEntryTableViewCell {
            switch indexPath.section {
            case 0:
                cell.titleLabel.text = attributesResults?[indexPath.row].title
            case 1:
                cell.titleLabel.text = conditionResults?[indexPath.row].title
            case 2:
                cell.titleLabel.text = edgesResults?[indexPath.row].title
            case 3:
                cell.titleLabel.text = hindranceResults?[indexPath.row].title
            case 4:
                cell.titleLabel.text = raceResults?[indexPath.row].title
            case 5:
                cell.titleLabel.text = skillResults?[indexPath.row].title
            default:
                print("Notion Cell")
            }
            return cell
            
        }
        return UITableViewCell()
    }
    


}
