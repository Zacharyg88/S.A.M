//
//  SWHeroCreationViewController.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/1/21.
//

import UIKit

class SWHeroCreationViewController: UIViewController {
    
    @IBOutlet weak var progressContainerView: UIView!
    @IBOutlet weak var progress1View: UIView!
    @IBOutlet weak var progress2View: UIView!
    @IBOutlet weak var progress3View: UIView!
    @IBOutlet weak var progress4View: UIView!
    @IBOutlet weak var progress5View: UIView!
    @IBOutlet weak var progress6View: UIView!
    @IBOutlet weak var progress7View: UIView!
    @IBOutlet weak var progress8View: UIView!
    @IBOutlet weak var creationStageContainerView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!

    var newHero: HeroModel = HeroModel()
    var heroImage: UIImage?
    var progressViewArray: [UIView] = []
    var creationStageViewsArray: [UIView] = []
    var currentStage: Int = 0 {
        didSet {
            for i in 0...7 {
                if i <= currentStage {
                    progressViewArray[i].backgroundColor = UIColor(named: "SWBacking")
                }else {
                    progressViewArray[i].backgroundColor = UIColor(named: "SWSubheading")
                }
                for view in creationStageContainerView.subviews {
                    view.removeFromSuperview()
                    view.willMove(toSuperview: nil)
                }
                creationStageContainerView.addSubview(creationStageViewsArray[currentStage])
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.layer.cornerRadius = 8
        progressViewArray = [progress1View, progress2View, progress3View, progress4View, progress5View, progress6View, progress7View, progress8View]
        for view in progressViewArray {
            view.layer.cornerRadius = view.frame.height / 2
        }
        
        let conceptView: HeroConceptCreationView = HeroConceptCreationView(frame: self.creationStageContainerView.bounds)
        conceptView.hostVC = self
        
        let raceView: HeroCreationRaceView = HeroCreationRaceView(frame: self.creationStageContainerView.bounds)
        raceView.hostVC = self
        
        let hindranceView: HeroCreationHindrancesView = HeroCreationHindrancesView(frame: self.creationStageContainerView.bounds)
        hindranceView.hostVC = self
        
        let attributesView: HeroCreationAttributesView = HeroCreationAttributesView(frame: self.creationStageContainerView.bounds)
        
        let skillsView: HeroCreationSkillsView = HeroCreationSkillsView(frame: self.creationStageContainerView.bounds)
        skillsView.hostVC = self
        
        creationStageViewsArray = [conceptView, raceView, hindranceView, attributesView, skillsView]
        
        currentStage = 0
    }
    
    
    
    @IBAction func backTapped(_ sender: Any) {
        self.currentStage -= 1
    }
    
    @IBAction func continueTapped(_ sender: Any) {
        switch self.currentStage {
        case 0:
            //Concept
            if let conceptView: HeroConceptCreationView = creationStageViewsArray[0] as? HeroConceptCreationView {
                self.newHero.concept = conceptView.conceptTextView.text
                if conceptView.image != nil {
                    self.heroImage = conceptView.image
                }
            }
        case 1:
            if let raceView: HeroCreationRaceView = creationStageViewsArray[1] as? HeroCreationRaceView {
                self.newHero.race = raceView.currentRace
            }
        case 2:
            if let hindrancesView: HeroCreationHindrancesView = creationStageViewsArray[2] as? HeroCreationHindrancesView {
                self.newHero.hinderances = hindrancesView.selectedHindrances
            }
        case 3:
            if let attributesView: HeroCreationAttributesView = creationStageViewsArray[3] as? HeroCreationAttributesView {
                let agility = AttributeModel()
                agility.dice = attributesView.agilityDice
                agility.title = "Agility"
                
                let smarts = AttributeModel()
                smarts.title = "Smarts"
                smarts.dice = attributesView.smartsDice
                
                let spirit = AttributeModel()
                spirit.title = "Spirit"
                spirit.dice = attributesView.spiritDice
                
                 let strength = AttributeModel()
                strength.title = "Strength"
                strength.dice = attributesView.strengthDice
                
                let vigor = AttributeModel()
                vigor.title = "Vigor"
                vigor.dice = attributesView.vigorDice
                
                self.newHero.attributes = [agility, smarts, spirit, strength, vigor]
            }
        default:
            print("default")
        }
        self.currentStage += 1
    }
    
}
