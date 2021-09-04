//
//  HeroObjectDetailsView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/1/21.
//

import Foundation
import UIKit

class HeroObjectDetailsView: UIView {
    
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var leftHeader1: UILabel!
    @IBOutlet weak var leftDescription1: UILabel!
    @IBOutlet weak var rightHeader1: UILabel!
    @IBOutlet weak var rightDescription1: UILabel!
    @IBOutlet weak var leftHeader2: UILabel!
    @IBOutlet weak var leftDescription2: UILabel!
    @IBOutlet weak var rightHeader2: UILabel!
    @IBOutlet weak var rightDescription2: UILabel!
    @IBOutlet weak var leftHeader3: UILabel!
    @IBOutlet weak var leftDescription3: UILabel!
    @IBOutlet weak var rightHeader3: UILabel!
    @IBOutlet weak var rightDescription3: UILabel!
    @IBOutlet weak var leftHeader4: UILabel!
    @IBOutlet weak var leftDescription4: UILabel!

    
    
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
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 8, height: -20)
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 0.75
        self.layer.cornerRadius = 12
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeToDismiss))
        swipeGestureRecognizer.direction = .down
        self.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    @objc func swipeToDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.frame = CGRect(x: 0, y: UIScreen.main.bounds.maxY / 2, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        } completion: { (done) in
            if done {
                self.removeFromSuperview()
                self.willMove(toSuperview: nil)
            }
        }

    }
    
}
