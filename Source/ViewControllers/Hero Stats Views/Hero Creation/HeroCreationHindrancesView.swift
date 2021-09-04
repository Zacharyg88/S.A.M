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
    
    var selectedHindrances:[HindranceModel] = [] {
        didSet {
            var totalPoints = 0
            for hindrance in selectedHindrances {
                if hindrance.level == "Major" {
                    totalPoints += 2
                } else
                if hindrance.level == "Minor" {
                    totalPoints += 1
                }else {
                    let levelAlert: UIAlertController = UIAlertController()
                    levelAlert.title = "Major or Minor?"
                    levelAlert.preferredStyle = .alert
                    levelAlert.message = "This Hindrance can be taken as either Major or Minor. Which would you like to select?"
                    var majorAction: UIAlertAction = UIAlertAction(title: "Major", style: .default) { ACTION in
                        <#code#>
                    }
                }
                
            }
            self.hindranceCountLabel.text = "\(totalPoints)"
            if totalPoints > 4 {
                self.hindranceCountLabel.textColor = .red
            }else {
                self.hindranceCountLabel.textColor = UIColor(named: "SWPower_Light")
            }
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
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hindrance = hindrances[indexPath.row]
        if self.selectedHindrances.contains(hindrance) {
            self.selectedHindrances.remove(at: selectedHindrances.lastIndex(of: hindrance) ?? 0)
        }else {
            selectedHindrances.append(hindrance)
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
    }
    
    
    
    
}
