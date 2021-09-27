//
//  SWHeroConditionActionSelectionView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/13/21.
//

import Foundation
import UIKit


class SWHeroConditionActionSelectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, DetailAddDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedCondition: ConditionModel?
    var conditions: [ConditionModel] = []
    var hostVC: SWHeroViewController?
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
        self.layer.cornerRadius = 24
        
        let swipeGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(animateToClosed))
        swipeGesture.direction = .down
        self.addGestureRecognizer(swipeGesture)
        
        collectionView.register(UINib(nibName: "SWHeroConditionActionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SWHeroConditionActionCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    
    
    func animateToHalf() {
        UIView.animate(withDuration: 0.3) {
            self.frame = CGRect(x: 0, y: UIScreen.main.bounds.midY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        }
    }
    
    @objc func animateToClosed() {
        UIView.animate(withDuration: 0.3) {
            self.frame = CGRect(x: 0, y: UIScreen.main.bounds.maxY - self.collectionView.contentSize.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.removeFromSuperview()
            self.willMove(toSuperview: nil)
        }
        hostVC?.isPresentingConditionView = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return conditions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let condition = conditions[indexPath.row]
        let defaultSize = condition.title?.size(withAttributes: [NSAttributedString.Key.font: UIFont(name: "Oxanium", size: 14)])
        
        return CGSize(width: (defaultSize?.width ?? 0) + 36, height: 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: SWHeroConditionActionCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SWHeroConditionActionCollectionViewCell", for: indexPath) as? SWHeroConditionActionCollectionViewCell {
            cell.backgroundColor = UIColor(named: "SWRed")
            cell.label.text = conditions[indexPath.row].title
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let condition = conditions[indexPath.row]
        let detailView: HeroObjectDetailsView = HeroObjectDetailsView(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2))
        self.selectedCondition = condition
        detailView.bannerView.backgroundColor = UIColor(named: "SWRed")
        detailView.typeLabel.text = "Condition"
        detailView.nameLabel.text = condition.title ?? ""
        detailView.leftHeader1.text = "Summary"
        detailView.leftDescription1.text = condition.summary ?? ""
        detailView.plusButton.isHidden = false
        detailView.delegate = self
        self.hostVC?.view.addSubview(detailView)
        self.hostVC?.view.bringSubviewToFront(detailView)
        UIView.animate(withDuration: 0.3) {
            detailView.frame = CGRect(x: 0, y: UIScreen.main.bounds.midY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        }
    }
    
    func detailViewAddTapped() {
        self.hostVC?.activeConditions.append(self.selectedCondition ?? ConditionModel())
        self.animateToClosed()
    }
    
}

