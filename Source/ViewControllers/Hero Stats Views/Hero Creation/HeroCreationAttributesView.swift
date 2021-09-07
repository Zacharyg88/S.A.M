//
//  HeroCreationAttributesView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/3/21.
//

import Foundation
import UIKit

class HeroCreationAttributesView: UIView {
    
    @IBOutlet weak var remainingPointsLabel: UILabel!
    @IBOutlet weak var agilityDieLabel: UILabel!
    @IBOutlet weak var agilityDieImageView: UIImageView!
    @IBOutlet weak var smartsDieLabel: UILabel!
    @IBOutlet weak var smartsDieImageView: UIImageView!
    @IBOutlet weak var spiritDieLabel: UILabel!
    @IBOutlet weak var spiritDieImageView: UIImageView!
    @IBOutlet weak var strengthDieLabel: UILabel!
    @IBOutlet weak var strengthDieImageView: UIImageView!
    @IBOutlet weak var vigorDieLabel: UILabel!
    @IBOutlet weak var vigorDieImageView: UIImageView!
    
    var agilityDice = DiceModel() {
        didSet {
            agilityDieLabel.text = agilityDice.title ?? ""
            agilityDieImageView.image = UIImage(named: "icon_\(agilityDice.title ?? "")")
        }
    }
    var smartsDice = DiceModel(){
        didSet {
            smartsDieLabel.text = smartsDice.title ?? ""
            smartsDieImageView.image = UIImage(named: "icon_\(smartsDice.title ?? "")")
        }
    }
    var spiritDice = DiceModel() {
        didSet {
            spiritDieLabel.text = spiritDice.title ?? ""
            spiritDieImageView.image = UIImage(named: "icon_\(spiritDice.title ?? "")")
        }
    }
    var strengthDice = DiceModel() {
        didSet {
            strengthDieLabel.text = strengthDice.title ?? ""
            strengthDieImageView.image = UIImage(named: "icon_\(strengthDice.title ?? "")")
        }
    }
    var vigorDice = DiceModel() {
        didSet {
            vigorDieLabel.text = vigorDice.title ?? ""
            vigorDieImageView.image = UIImage(named: "icon_\(vigorDice.title ?? "")")
        }
    }
    var hostVC: SWHeroCreationViewController?
    var isUsingHindrancePoints: Bool = false
    var remainingPoints = 5 {
        didSet {
            self.remainingPointsLabel.text = "\(remainingPoints)"
            if remainingPoints < 0 {
                self.remainingPointsLabel.textColor = .red
                if !isUsingHindrancePoints {
                    let hindranceAlert = UIAlertController(title: "Out of Points!", message: "You've spent all your allotted points for increasing attributes. Would you like to spend Hindrance points to continue raising attribute levels?", preferredStyle: .alert)
                    let yesAction: UIAlertAction = UIAlertAction(title: "Yes", style: .default) { (action) in
                        self.remainingPoints = self.hostVC?.hindrancePoints ?? 0
                    }
                    let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
                    
                    hindranceAlert.addAction(yesAction)
                    hindranceAlert.addAction(cancelAction)
                    self.hostVC?.present(hindranceAlert, animated: true, completion: nil)
                }
            }else {
                self.remainingPointsLabel.textColor = .white
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
        let diceArray = [agilityDice, smartsDice, spiritDice, strengthDice, vigorDice]
        for die in diceArray {
            die.sides = 4
            die.title = "d4"
        }
        
        
    }
    
    @IBAction func agilityUp(_ sender: Any) {
        agilityDice = agilityDice.incrementDieType(isIncrease: true)
        remainingPoints -= 1
    }
    
    @IBAction func agilityDown(_ sender: Any) {
        agilityDice = agilityDice.incrementDieType(isIncrease: false)
        remainingPoints += 1
    }
    
    @IBAction func smartsUp(_ sender: Any) {
        smartsDice = smartsDice.incrementDieType(isIncrease: true)
        remainingPoints -= 1

    }
    
    @IBAction func smartsDown(_ sender: Any) {
        smartsDice = smartsDice.incrementDieType(isIncrease: false)
        remainingPoints += 1

    }
    
    @IBAction func spiritUp(_ sender: Any) {
        spiritDice = spiritDice.incrementDieType(isIncrease: true)
        remainingPoints -= 1

    }
    
    @IBAction func spiritDown(_ sender: Any) {
        spiritDice = spiritDice.incrementDieType(isIncrease: false)
        remainingPoints += 1

    }
    
    @IBAction func strengthUp(_ sender: Any) {
        strengthDice = strengthDice.incrementDieType(isIncrease: true)
        remainingPoints -= 1

    }
    @IBAction func strengthDown(_ sender: Any) {
        strengthDice = strengthDice.incrementDieType(isIncrease: false)
        remainingPoints += 1

    }
    
    @IBAction func vigorUp(_ sender: Any) {
        vigorDice = vigorDice.incrementDieType(isIncrease: true)
        remainingPoints -= 1

    }
    
    @IBAction func vigorDown(_ sender: Any) {
        vigorDice = vigorDice.incrementDieType(isIncrease: false)
        remainingPoints += 1

    }
    
}
