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
        
        progressViewArray = [progress1View, progress2View, progress3View, progress4View, progress5View, progress6View, progress7View, progress8View]
        for view in progressViewArray {
            view.layer.cornerRadius = view.frame.height / 2
        }
        
        let conceptView: HeroConceptCreationView = HeroConceptCreationView(frame: self.creationStageContainerView.bounds)
        conceptView.hostVC = self
        
        creationStageViewsArray = [conceptView]
        
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
        default:
            print("default")
        }
        self.currentStage += 1
    }
    
}
