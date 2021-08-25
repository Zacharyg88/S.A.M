//
//  InitialViewController.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/22/21.
//

import UIKit

class InitialViewController: UIViewController {
    
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var SAMImageView: UIImageView!

    
    var SAMLoadingImageView: UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingLabel.alpha = 0
        SAMImageView.alpha = 0
        loadingLabel.text = "Initializing S.A.M. "
        //animateLoadingLabel()
        var imageView = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.midX - 44.5), y: (UIScreen.main.bounds.midY - 44.5), width: 89, height: 89))
        imageView.image = UIImage(named: "sam_load")
        imageView.alpha = 0
        self.SAMLoadingImageView = imageView
        self.view.addSubview(self.SAMLoadingImageView ?? UIImageView())
        self.view.bringSubviewToFront(self.SAMLoadingImageView ?? UIImageView())
        self.SAMLoadingImageView?.willMove(toSuperview: self.view)
        self.animateLoadingImage(state: "sam_load_b")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 0.3) {
//            self.loadingLabel.alpha = 1
//            self.SAMImageView.alpha = 1
//
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        shouldRepeatAnimation = false
    }
    
    var shouldRepeatAnimation: Bool = true
    var hasShrunkCount = 0
    func animateLoadingImage(state: String) {
        if self.SAMLoadingImageView?.alpha == 0 {
            UIView.animate(withDuration: 0.3) {
                self.SAMLoadingImageView?.alpha = 1
            } completion: { (done) in
                if done {
                    self.animateLoadingImage(state: "sam_load_b")
                }
            }
        } else {
            
            switch state {
            case "sam_load_b":
                UIView.transition(with: self.SAMLoadingImageView ?? UIImageView(),
                                  duration: 0.2,
                                  options: [.preferredFramesPerSecond60, .transitionCrossDissolve]) {
                    self.SAMLoadingImageView?.image = UIImage(named: "sam_load_b")
                    self.SAMLoadingImageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
                    
                } completion: { (done) in
                    if done {
                        self.hasShrunkCount += 1
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            if self.hasShrunkCount > 8 {
                                self.animateLoadingImage(state: "default")
                            }else {
                                self.animateLoadingImage(state: "sam_load")
                            }
                        }
                    }
                }
            case "sam_load":
                UIView.transition(with: self.SAMLoadingImageView ?? UIImageView(),
                                  duration: 0.2,
                                  options: [.preferredFramesPerSecond60, .transitionCrossDissolve]) {
                    self.SAMLoadingImageView?.image = UIImage(named: "sam_load")
                    self.SAMLoadingImageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)


                } completion: { (done) in
                    if done {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            self.animateLoadingImage(state: "sam_load_b")
                        }
                    }
                }
            default:
                
                UIView.transition(with: self.SAMLoadingImageView ?? UIImageView(),
                                  duration: 0.2,
                                  options: [.preferredFramesPerSecond60, .transitionCrossDissolve]) {
                    self.SAMLoadingImageView?.frame = CGRect(x: 36, y: 64, width: 28, height: 28)
                    self.SAMLoadingImageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)


                } completion: { (done) in
                    if done {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            UIView.animate(withDuration: 0.5) {
                                self.SAMImageView.alpha = 1
                                self.loadingLabel.alpha = 1
                                self.SAMLoadingImageView?.alpha = 0
                            } completion: { (done) in
                                if done {
                                    self.animateLoadingLabel()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func animateLoadingLabel() {
        UIView.animate(withDuration: 0.3) {
            switch self.loadingLabel.text?.count ?? 0 {
            case 26:
                self.loadingLabel.text = ">> RETRIEVING PRIMARY MENU."
            case 27:
                self.loadingLabel.text = ">> RETRIEVING PRIMARY MENU.."
            case 28:
                self.loadingLabel.text = ">> RETRIEVING PRIMARY MENU..."
            default:
                self.loadingLabel.text = ">> RETRIEVING PRIMARY MENU"
            }
        } completion: { (done) in
            if done {
                if self.shouldRepeatAnimation {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.animateLoadingLabel()
                    }
                }
            }
        }

    }

}
