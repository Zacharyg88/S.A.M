//
//  HeroObjectDetailsView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/1/21.
//

import Foundation
import UIKit

protocol DetailAddDelegate {
    func detailViewAddTapped()
}

class HeroObjectDetailsView: UIView {
    
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
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

    
    var delegate: DetailAddDelegate?
    
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
        
        plusButton.layer.cornerRadius = plusButton.frame.height / 2
        plusButton.layer.borderWidth = 1.5
        plusButton.layer.borderColor = UIColor(named: "SWSubheading")?.cgColor
        plusButton.isHidden = true
    }
    
    @objc func swipeToDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.frame = CGRect(x: 0, y: UIScreen.main.bounds.maxY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        } completion: { (done) in
           
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self.removeFromSuperview()
            self.willMove(toSuperview: nil)
        }
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        self.swipeToDismiss()
        self.delegate?.detailViewAddTapped()
    }
}
