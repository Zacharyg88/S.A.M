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
    @IBOutlet weak var agilityDownButton: UIButton!
    @IBOutlet weak var agilityUPButton: UIButton!
    @IBOutlet weak var smartsDieLabel: UILabel!
    @IBOutlet weak var smartsDieImageView: UIImageView!
    @IBOutlet weak var smartsDownButton: UIButton!
    @IBOutlet weak var smartsUpButton: UIButton!
    @IBOutlet weak var spiritDieLabel: UILabel!
    @IBOutlet weak var spiritDieImageView: UIImageView!
    @IBOutlet weak var spiritDownButton: UIButton!
    @IBOutlet weak var spiritUpButton: UIButton!
    @IBOutlet weak var strengthDieLabel: UILabel!
    @IBOutlet weak var strengthDieImageView: UIImageView!
    @IBOutlet weak var strengthDownButton: UIButton!
    @IBOutlet weak var strengthUpButton: UIButton!
    @IBOutlet weak var vigorDieLabel: UILabel!
    @IBOutlet weak var vigorDieImageView: UIImageView!
    @IBOutlet weak var vigorDownButton: UIButton!
    @IBOutlet weak var vigorUpButton: UIButton!
    
    var agilityDice = DiceModel() {
        didSet {
            agilityDieLabel.text = agilityDice.title ?? ""
            agilityUPButton.isEnabled = agilityDice.sides ?? 0 < 12
            agilityDownButton.isEnabled = agilityDice.sides ?? 0 > 4
            agilityDieImageView.image = UIImage(named: "icon_\(agilityDice.title ?? "")")
        }
    }
    var smartsDice = DiceModel(){
        didSet {
            smartsDieLabel.text = smartsDice.title ?? ""
            smartsDieImageView.image = UIImage(named: "icon_\(smartsDice.title ?? "")")
            smartsUpButton.isEnabled = smartsDice.sides ?? 0 < 12
            smartsDownButton.isEnabled = smartsDice.sides ?? 0 > 4
        }
    }
    var spiritDice = DiceModel() {
        didSet {
            spiritDieLabel.text = spiritDice.title ?? ""
            spiritDieImageView.image = UIImage(named: "icon_\(spiritDice.title ?? "")")
            
            spiritUpButton.isEnabled = spiritDice.sides ?? 0 < 12
            spiritDownButton.isEnabled = spiritDice.sides ?? 0 > 4
        }
    }
    var strengthDice = DiceModel() {
        didSet {
            strengthDieLabel.text = strengthDice.title ?? ""
            strengthDieImageView.image = UIImage(named: "icon_\(strengthDice.title ?? "")")
            
            strengthUpButton.isEnabled = strengthDice.sides ?? 0 < 12
            strengthDownButton.isEnabled = strengthDice.sides ?? 0 > 4
        }
    }
    var vigorDice = DiceModel() {
        didSet {
            vigorDieLabel.text = vigorDice.title ?? ""
            vigorDieImageView.image = UIImage(named: "icon_\(vigorDice.title ?? "")")
            
            vigorUpButton.isEnabled = vigorDice.sides ?? 0 < 12
            vigorDownButton.isEnabled = vigorDice.sides ?? 0 > 4
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
        agilityDownButton.isEnabled = false
        smartsDownButton.isEnabled = false
        spiritDownButton.isEnabled = false
        strengthDownButton.isEnabled = false
        vigorDownButton.isEnabled = false
        
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
        smartsUpButton.isEnabled = smartsDice.sides ?? 0 < 12

        remainingPoints -= 1

    }
    
    @IBAction func smartsDown(_ sender: Any) {
        smartsDice = smartsDice.incrementDieType(isIncrease: false)
        smartsDownButton.isEnabled = smartsDice.sides ?? 0 > 4

        remainingPoints += 1

    }
    
    @IBAction func spiritUp(_ sender: Any) {
        spiritDice = spiritDice.incrementDieType(isIncrease: true)
        spiritUpButton.isEnabled = spiritDice.sides ?? 0 < 12

        remainingPoints -= 1

    }
    
    @IBAction func spiritDown(_ sender: Any) {
        spiritDice = spiritDice.incrementDieType(isIncrease: false)
        spiritDownButton.isEnabled = spiritDice.sides ?? 0 > 4

        remainingPoints += 1

    }
    
    @IBAction func strengthUp(_ sender: Any) {
        strengthDice = strengthDice.incrementDieType(isIncrease: true)
        strengthUpButton.isEnabled = strengthDice.sides ?? 0 < 12

        remainingPoints -= 1

    }
    @IBAction func strengthDown(_ sender: Any) {
        strengthDice = strengthDice.incrementDieType(isIncrease: false)
        strengthDownButton.isEnabled = strengthDice.sides ?? 0 > 4

        remainingPoints += 1

    }
    
    @IBAction func vigorUp(_ sender: Any) {
        vigorDice = vigorDice.incrementDieType(isIncrease: true)
        vigorUpButton.isEnabled = vigorDice.sides ?? 0 < 12

        remainingPoints -= 1

    }
    
    @IBAction func vigorDown(_ sender: Any) {
        vigorDice = vigorDice.incrementDieType(isIncrease: false)
        vigorDownButton.isEnabled = vigorDice.sides ?? 0 > 4
        remainingPoints += 1

    }
    
}
