//
//  HeroCreationEdgesView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/3/21.
//

import Foundation
import UIKit

class HeroCreationEdgesView: UIView, UITableViewDelegate, UITableViewDataSource, edgeSelectionDelegate {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pointsRemainingLabel: UILabel!
    
    var hostVC: SWHeroCreationViewController?
    var selectedEdges: [EdgeModel] = []
    var pointsRemaining: Int = 0 {
        didSet {
            self.pointsRemainingLabel.text = "\(pointsRemaining)"
        }
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadAndShowNib()
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadAndShowNib()
        setupView()
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SWHeroEdgesTableViewCell", bundle: nil), forCellReuseIdentifier: "SWHeroEdgesTableViewCell")
        self.pointsRemaining = self.hostVC?.hindrancePoints ?? 0
        self.clipsToBounds = true
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: HeroCreationEdgesTableViewSectionHeaderView = HeroCreationEdgesTableViewSectionHeaderView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 56))
        switch section {
        case 0:
            view.headerLabel.text = "Background Edges"
        case 1:
            view.headerLabel.text = "Combat Edges"
        case 2:
            view.headerLabel.text = "Leadership Edges"
        case 3:
            view.headerLabel.text = "Power Edges"
        case 4:
            view.headerLabel.text = "Professional Edges"
        case 5:
            view.headerLabel.text = "Social Edges"
        case 6:
            view.headerLabel.text = "Weird Edges"
        default:
            view.headerLabel.text = "Legendary Edges"
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getLibraryForSection(section: section).edges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let edges: [EdgeModel] = getLibraryForSection(section: indexPath.section).edges
        if let edgeCell: SWHeroEdgesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SWHeroEdgesTableViewCell", for: indexPath) as? SWHeroEdgesTableViewCell {
            edgeCell.edgeLabel.text = edges[indexPath.row].title
            edgeCell.cellEdge = edges[indexPath.row]
            if self.selectedEdges.contains(edges[indexPath.row]) {
                edgeCell.addButton.setImage(UIImage(named: "icon_minus_button"), for: UIControl.State())
                edgeCell.backgroundColor = UIColor(named: "SWPower_Light")
            }else {
                edgeCell.addButton.setImage(UIImage(named: "icon_plus_button"), for: UIControl.State())
                edgeCell.backgroundColor = UIColor(named: "SWStrength_Vigor")
            }
            edgeCell.delegate = self
            return edgeCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let edge = getLibraryForSection(section: indexPath.section).edges[indexPath.row]
        let detailView: HeroObjectDetailsView = HeroObjectDetailsView(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2))
        
        detailView.bannerView.backgroundColor = UIColor(named: "SWGreen_Light")
        detailView.typeLabel.text = "Edge"
        detailView.nameLabel.text = edge.title ?? ""
        detailView.leftHeader1.text = "Pre-Requisites"
        detailView.leftDescription1.text = (edge.requiredSkillName ?? "") + " " + (edge.requiredSkillLevel ?? "")
        detailView.rightHeader1.text = "Experience"
        detailView.rightDescription1.text = edge.requiredExperience ?? ""
        detailView.leftHeader2.text = "Summary"
        detailView.leftDescription2.text = edge.summary ?? ""
        
        self.hostVC?.view.addSubview(detailView)
        self.hostVC?.view.bringSubviewToFront(detailView)
        UIView.animate(withDuration: 0.5) {
            detailView.frame = CGRect(x: 0, y: UIScreen.main.bounds.midY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        }
        
        
    }
    
    
    func getLibraryForSection(section: Int) -> EdgeCategory {
        switch section {
        case 0:
            return ruleBook.edges.Background_Edges ?? EdgeCategory()
        case 1:
            return ruleBook.edges.Combat_Edges ??  EdgeCategory()
        case 2:
            return ruleBook.edges.Leadership_Edges ?? EdgeCategory()
        case 3:
            return ruleBook.edges.Power_Edges ?? EdgeCategory()
        case 4:
            return ruleBook.edges.Professional_Edges ?? EdgeCategory()
        case 5:
            return ruleBook.edges.Social_Edges ?? EdgeCategory()
        case 6:
            return ruleBook.edges.Weird_Edges ?? EdgeCategory()
        default:
            return ruleBook.edges.Legendary_Edges ?? EdgeCategory()
        }

    }
    
    func didSelectEdge(edge: EdgeModel) {
        if pointsRemaining > 1 {
            self.selectedEdges.append(edge)
            self.pointsRemaining -= 2
        }else {
            let pointsAlert: UIAlertController = UIAlertController(title: "Not Enough Points!", message: "You do not have enough Hindrance Points to aquire this Edge. Either remove a currently selected Edge or return to the Hindrance page to take additional Hindrances and get more points.", preferredStyle: .alert)
            let okAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            pointsAlert.addAction(okAction)
            self.hostVC?.present(pointsAlert, animated: true, completion: nil)
        }
        
    }
    
    func didDeSelectEdge(edge: EdgeModel) {
        if selectedEdges.contains(edge) {
            self.selectedEdges.remove(at: self.selectedEdges.firstIndex(of: edge) ?? 0)
            self.pointsRemaining += 2
        }
    }
    
    
}
