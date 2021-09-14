//
//  SWHeroConditionActionSelectionView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/13/21.
//

import Foundation
import UIKit


class SWHeroConditionActionSelectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var conditions: [ConditionModel] = []
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
        self.layer.shadowOffset = CGSize(width: 0, height: -64)
        self.layer.shadowRadius = 64
        self.layer.shadowOpacity = 0.75
        self.frame = CGRect(x: 0, y: UIScreen.main.bounds.maxY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        
        collectionView.register(UINib(nibName: "SWHeroConditionActionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SWHeroConditionActionCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    
    
    func animateToHalf() {
        UIView.animate(withDuration: 0.3) {
            self.frame = CGRect(x: 0, y: UIScreen.main.bounds.midY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return conditions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let condition = conditions[indexPath.row]
        return condition.title?.size(withAttributes: [NSAttributedString.Key.font: UIFont(name: "Oxanium", size: 14)]) ?? CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
}

