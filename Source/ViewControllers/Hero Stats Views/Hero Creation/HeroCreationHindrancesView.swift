//
//  HeroCreationHindrancesView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/3/21.
//

import Foundation
import UIKit

class HeroCreationHindrancesView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var hindrancesTitleLabel: UILabel!
    @IBOutlet weak var hindrancesSubtitleLabel: UILabel!
    @IBOutlet weak var hindranceCountLabel: UILabel!
    @IBOutlet weak var hindranceTableView: UITableView!
    
    var hindrances = ruleBook.hinderances.Hinderances
    var hostVC: SWHeroCreationViewController?
    var totalPoints = 0 {
        didSet {
            self.hindranceCountLabel.text = "\(totalPoints)"
            if totalPoints > 4 {
                self.hindranceCountLabel.textColor =  UIColor.red
            }else {
                self.hindranceCountLabel.textColor = UIColor(named: "SWPower_Light")
            }
        }
    }
    var selectedHindrances:[HindranceModel] = []
    
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
        hindranceTableView.delegate = self
        hindranceTableView.dataSource = self
        hindranceTableView.register(UINib(nibName: "HeroCreationHindranceTableViewCell", bundle: nil), forCellReuseIdentifier: "HeroCreationHindranceTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hindrances.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: HeroCreationHindranceTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HeroCreationHindranceTableViewCell", for: indexPath) as? HeroCreationHindranceTableViewCell {
            cell.titleLabel.text = hindrances[indexPath.row].title
            cell.subtitleLabel.text = hindrances[indexPath.row].level
            cell.row = indexPath.row
            cell.hostVC = self
            
            if self.selectedHindrances.contains(hindrances[indexPath.row]) {
                cell.disclosureImageView.image = UIImage(named: "icon_minus")
                cell.layer.borderWidth = 2
                cell.layer.borderColor = UIColor(named: "SWBlue_Light")?.cgColor
            }else {
                cell.disclosureImageView.image = UIImage(systemName: "plus")
                cell.layer.borderWidth = 0
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hindrance = hindrances[indexPath.row]
        let detailView: HeroObjectDetailsView = HeroObjectDetailsView(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY, width: self.hostVC?.view.frame.width ?? 0, height: UIScreen.main.bounds.height / 2))
        
        detailView.bannerView.backgroundColor = UIColor(named: "SWRed")
        detailView.typeLabel.text = "Hindrance"
        detailView.nameLabel.text = hindrance.title
        detailView.leftHeader1.text = "Level"
        detailView.leftDescription1.text = hindrance.level
        detailView.rightHeader1.isHidden = true
        detailView.rightDescription1.isHidden = true
        detailView.rightHeader2.isHidden = true
        detailView.rightDescription2.isHidden = true
        detailView.rightHeader3.isHidden = true
        detailView.rightDescription3.isHidden = true
        detailView.leftHeader2.text = "Summary"
        detailView.leftDescription2.text = hindrance.summary
        detailView.leftHeader3.isHidden = true
        detailView.leftDescription3.isHidden = true
        detailView.leftHeader4.isHidden = true
        detailView.leftDescription4.isHidden = true
        
        self.hostVC?.view.addSubview(detailView)
        self.hostVC?.view.bringSubviewToFront(detailView)
        UIView.animate(withDuration: 0.5) {
            detailView.frame = CGRect(x: 0, y: UIScreen.main.bounds.maxY / 2, width: self.hostVC?.view.frame.width ?? 0, height: UIScreen.main.bounds.height / 2)
        }
        
    }
    
    func addHindrance(row: Int) {
        let hindrance = hindrances[row]
        if self.selectedHindrances.contains(hindrance) {
            for selectedHindrance in selectedHindrances {
                if selectedHindrance.title == hindrance.title {
                    if selectedHindrance.level == "Major" {
                        self.totalPoints -= 2
                    }else {
                        self.totalPoints -= 1
                    }
                    self.selectedHindrances.removeAll { (hm) -> Bool in
                        if hm.title == hindrance.title {
                            return true
                        }else {
                            return false
                        }
                    }
                }
            }
            self.hindranceTableView.reloadData()
            
        }else {
            if hindrance.level == "Major" {
                self.totalPoints += 2
                self.selectedHindrances.append(hindrance)
            }else if hindrance.level == "Minor" {
                self.totalPoints += 1
                self.selectedHindrances.append(hindrance)
            }else {
                let hindranceAlert: UIAlertController = UIAlertController()
                hindranceAlert.title = "Major or Minor?"
                hindranceAlert.message = "This Hindrance can be taken as either Major or Minor. Which would you like?"
                let majorAction: UIAlertAction = UIAlertAction(title: "Major", style: .default) { (action) in
                    self.totalPoints += 2
                    hindrance.level = "Major"
                    self.selectedHindrances.append(hindrance)
                }
                let minorAction: UIAlertAction = UIAlertAction(title: "Minor", style: .default) { (action) in
                    self.totalPoints += 1
                    hindrance.level = "Minor"
                    self.selectedHindrances.append(hindrance)
                }
                let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                    hindranceAlert.dismiss(animated: true, completion: nil)
                }
                hindranceAlert.addAction(majorAction)
                hindranceAlert.addAction(minorAction)
                hindranceAlert.addAction(cancelAction)
                self.hostVC?.present(hindranceAlert, animated: true, completion: nil)
            }
        }
    }
    
    
}
