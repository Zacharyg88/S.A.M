//
//  HeroPowersView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/1/21.
//

import Foundation
import UIKit

class HeroPowersView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ppCountLabel: UILabel!
    @IBOutlet weak var addPPButton: UIButton!
    @IBOutlet weak var minusPPButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var powers: [PowerModel] = []
    var hostVC: SWHeroViewController?
    var delegate: HeroItemDetailDelegate?
    var globalMod: Int? {
        didSet {
            if globalMod == 0 {
                ppCountLabel.alpha = 0.25
                addPPButton.isEnabled = false
                minusPPButton.isEnabled = false
                tableView.isUserInteractionEnabled = false
            }else {
                ppCountLabel.alpha = 1
                addPPButton.isEnabled = true
                minusPPButton.isEnabled = true
                tableView.isUserInteractionEnabled = true
            }
            self.tableView.reloadData()
        }
    }
    var globalModIsNegative: Bool = false
    var currentPowerPoints: Int = 0 {
        didSet {
            self.ppCountLabel.text = "\(currentPowerPoints)"
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
        tableView.register(UINib(nibName: "HeroGearTableViewCell", bundle: nil), forCellReuseIdentifier: "HeroGearTableViewCell")
        self.currentPowerPoints = hostVC?.hero?.powerPoints ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 113
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return powers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: HeroGearTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HeroGearTableViewCell", for: indexPath) as? HeroGearTableViewCell {
            cell.powerItem = powers[indexPath.row]
            if globalMod != nil {
                if globalMod == 0 {
                    cell.activatePowerButton.isEnabled = false
                    cell.contentView.alpha = 0.25
                }else {
                    var modString = ""
                    var textColor = UIColor(named: "SWSubheading")
                    if globalModIsNegative {
                        modString.append(" - ")
                        textColor = UIColor.red
                    }else {
                        modString.append(" + ")
                        textColor = UIColor(named: "SWGreen")
                    }
                    modString.append("\(globalMod)")
                    cell.damageStatsLabel.text?.append(modString)
                    cell.damageStatsLabel.textColor = textColor
                }
            }else {
                cell.activatePowerButton.isEnabled = true
                cell.contentView.alpha = 1
            }
            cell.heroViewController = self.hostVC
            return cell
        }
        return UITableViewCell()
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        self.currentPowerPoints += 1
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
        self.currentPowerPoints -= 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.showDetailViewForItem(object: powers[indexPath.row])
    }
    
}
