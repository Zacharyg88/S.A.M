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
    @IBOutlet weak var creationStageContainerView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!

    var newHero: HeroModel = HeroModel()
    var heroViewController: SWHeroViewController?
    var heroImage: UIImage?
    var hindrancePoints: Int = 0 {
        didSet {
            if let edgesView: HeroCreationEdgesView = creationStageViewsArray[5] as? HeroCreationEdgesView {
                edgesView.pointsRemaining = hindrancePoints
            }
        }
    }
    var progressViewArray: [UIView] = []
    var creationStageViewsArray: [UIView] = []
    var currentStage: Int = 0 {
        didSet {
            for i in 0...6 {
                if i <= currentStage {
                    progressViewArray[i].backgroundColor = UIColor(named: "SWBacking")
                }else {
                    progressViewArray[i].backgroundColor = UIColor(named: "SWSubheading")
                }
                for view in creationStageContainerView.subviews {
                    view.removeFromSuperview()
                    view.willMove(toSuperview: nil)
                }
            }
            if currentStage == 0 {
                self.backButton.setTitle("Cancel", for: UIControl.State())
            }else  {
                self.backButton.setTitle("Back", for: UIControl.State())
            }
            if currentStage == 6 {
                self.continueButton.setTitle("Create Character", for: UIControl.State())
            }
            if currentStage < 7 {
                creationStageContainerView.addSubview(creationStageViewsArray[currentStage])
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.layer.cornerRadius = 8
        progressViewArray = [progress1View, progress2View, progress3View, progress4View, progress5View, progress6View, progress7View]
        for view in progressViewArray {
            view.layer.cornerRadius = view.frame.height / 2
        }
        continueButton.titleLabel?.numberOfLines = 0
        setupViews()
        newHero.level = 1
        newHero.bennies = 2
        newHero.gold = 1500
        newHero.isCurrentHero = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViews()
    }
    
    
    func setupViews() {
        var frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: self.creationStageContainerView.frame.height)
        self.creationStageContainerView.clipsToBounds = true
        self.view.clipsToBounds = true
        let conceptView: HeroConceptCreationView = HeroConceptCreationView(frame: frame)
        conceptView.hostVC = self
        
        let raceView: HeroCreationRaceView = HeroCreationRaceView(frame: frame)
        raceView.hostVC = self
        
        let hindranceView: HeroCreationHindrancesView = HeroCreationHindrancesView(frame: frame)
        hindranceView.hostVC = self
        
        let attributesView: HeroCreationAttributesView = HeroCreationAttributesView(frame: frame)
        
        let skillsView: HeroCreationSkillsView = HeroCreationSkillsView(frame: frame)
        skillsView.hostVC = self
        
        
        let edgesView: HeroCreationEdgesView = HeroCreationEdgesView(frame: frame)
        edgesView.pointsRemaining = self.hindrancePoints
        edgesView.hostVC = self
        
        let gearShopView: HeroCreationGearView = HeroCreationGearView(frame: frame)
        gearShopView.hostVC = self
        
        
        creationStageViewsArray = [conceptView, raceView, hindranceView, attributesView, skillsView, edgesView, gearShopView]
        creationStageContainerView.clipsToBounds = true
        newHero.gold = 1500
        currentStage = 0
    }
    
    
    
    @IBAction func backTapped(_ sender: Any) {
        if currentStage > 0 {
            self.currentStage -= 1
        }else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func continueTapped(_ sender: Any) {
        switch self.currentStage {
        case 0:
            //Concept
            if let conceptView: HeroConceptCreationView = creationStageViewsArray[0] as? HeroConceptCreationView {
                if (conceptView.nameTextField.text?.count ?? 0) > 0 {
                    self.newHero.concept = conceptView.conceptTextView.text
                    self.newHero.heroName = conceptView.nameTextField.text ?? ""
                    if conceptView.image != nil {
                        self.heroImage = conceptView.image
                    }
                }else {
                    let nameAlert: UIAlertController = UIAlertController(title: "Name your Hero", message: "Please enter a name for your new hero before continuing.", preferredStyle: .alert)
                    let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    nameAlert.addAction(okAction)
                    self.present(nameAlert, animated: true, completion: nil)
                }
            }
        case 1:
            if let raceView: HeroCreationRaceView = creationStageViewsArray[1] as? HeroCreationRaceView {
                self.newHero.race = raceView.currentRace
            }
        case 2:
            if let hindrancesView: HeroCreationHindrancesView = creationStageViewsArray[2] as? HeroCreationHindrancesView {
                self.newHero.hinderances = hindrancesView.selectedHindrances
                self.hindrancePoints = hindrancesView.totalPoints
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
                if attributesView.isUsingHindrancePoints {
                    self.hindrancePoints = attributesView.remainingPoints
                }
                self.newHero.attributes = [agility, smarts, spirit, strength, vigor]
            }
        case 4:
            if let skillsView: HeroCreationSkillsView = creationStageViewsArray[4] as? HeroCreationSkillsView {
                self.newHero.skills = skillsView.allSkills
            }
        case 5:
            if let edgesView: HeroCreationEdgesView = creationStageViewsArray[5] as? HeroCreationEdgesView {
                self.newHero.edges = edgesView.selectedEdges
            }
        default:
            print("default")
            
            databaseManager.postHeroToDatabase(hero: self.newHero, image: self.heroImage) { success, error in
                if error != nil {
                    print("There was an error posting the hero to the datbase \(error)")
                }else {
                    self.heroViewController?.getHeroesFromDB()
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        self.currentStage += 1
    }
    
}
