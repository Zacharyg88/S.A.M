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
        //loadingLabel.alpha = 0
        SAMImageView.alpha = 0
        loadingLabel.text = ">> Initializing S.A.M. "
        //animateLoadingLabel()
        var imageView = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.midX - 44.5), y: (UIScreen.main.bounds.midY - 44.5), width: 89, height: 89))
        imageView.image = UIImage(named: "sam_load")
        //imageView.alpha = 0
        self.SAMLoadingImageView = imageView
        self.view.addSubview(self.SAMLoadingImageView ?? UIImageView())
        self.view.bringSubviewToFront(self.SAMLoadingImageView ?? UIImageView())
        self.SAMLoadingImageView?.willMove(toSuperview: self.view)
        self.SAMLoadingImageView?.image = UIImage(named: "sam_load")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.newAnimateTest()
        }
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
    
    func newAnimateTest() {
        UIView.transition(with: self.SAMLoadingImageView ?? UIImageView(),
                          duration: 0.5,
                          options: [.preferredFramesPerSecond60, .transitionCrossDissolve]) {
            self.SAMLoadingImageView?.image = UIImage(named: "sam_load_b")
            self.SAMLoadingImageView?.transform = CGAffineTransform(rotationAngle: CGFloat().convertDegressToRadians(degrees: -90.0))
        } completion: { (done) in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    UIView.transition(with: self.SAMLoadingImageView ?? UIImageView(), duration: 0.5, options: [.preferredFramesPerSecond60, .transitionCrossDissolve]) {
                        self.SAMLoadingImageView?.frame = CGRect(x: 36, y: 36, width: 36, height: 36)
                        self.SAMLoadingImageView?.transform = .identity
                        
                    } completion: { (done) in
                        if done {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                UIView.transition(with: self.SAMImageView ?? UIImageView(), duration: 0.3, options: [.preferredFramesPerSecond60, .transitionCrossDissolve]) {
                                    self.SAMLoadingImageView?.frame = CGRect(x: 36, y: 64, width: 78, height: 45)
                                    self.SAMLoadingImageView?.image = UIImage(named: "sam_load_c")
                                } completion: { (done) in
                                    if done {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            UIView.animate(withDuration: 0.5) {
                                                self.SAMImageView.alpha = 1
                                                //self.loadingLabel.alpha = 1
                                                self.SAMLoadingImageView?.alpha = 0
                                            } completion: { (done) in
                                                if done {
                                                    self.loadingLabel.text = ">> "
                                                    self.animateLoadingLabel()
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    var shouldRepeatAnimation: Bool = true
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
