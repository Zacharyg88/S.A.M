//
//  SWHeroListView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/1/21.
//

import Foundation
import UIKit

class SWHeroListView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var createNewButton: UIButton!
    @IBOutlet weak var heroesTableView: UITableView!
    
    var heroes: [HeroModel] = []
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
        
        let swipeGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeToDismiss))
        swipeGesture.direction = .right
        self.addGestureRecognizer(swipeGesture)
        heroesTableView.delegate = self
        heroesTableView.dataSource = self
        heroesTableView.register(UINib(nibName: "SWHeroListTableViewCell", bundle: nil), forCellReuseIdentifier: "SWHeroListTableViewCell")
        createNewButton.layer.borderWidth = 1
        createNewButton.layer.borderColor = UIColor(named: "SWButton_Border")?.cgColor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: SWHeroListTableViewCell  = tableView.dequeueReusableCell(withIdentifier: "SWHeroListTableViewCell", for: indexPath) as? SWHeroListTableViewCell {
            cell.hero = heroes[indexPath.row]
            if cell.hero?.isCurrentHero ?? false {
                cell.heroContainerView.backgroundColor = UIColor(named: "SWBacking")
            }else {
                cell.heroContainerView.backgroundColor = .clear
            }
            
            cell.backgroundColor = .clear
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for i in 0...heroes.count {
            if let cell: SWHeroListTableViewCell = tableView.cellForRow(at: IndexPath(item: i, section: 0)) as? SWHeroListTableViewCell {
                if i == indexPath.row {
                    cell.heroContainerView.backgroundColor = UIColor(named: "SWBlue")
                }else {
                    cell.heroContainerView.backgroundColor = .clear
                }
            }
            
            hostVC?.hero = heroes[indexPath.row]
            self.swipeToDismiss()
        }
    }
    
    
    @IBAction func createNewTapped(_ sender: Any) {
        self.shouldLaunchCreation = true
        self.swipeToDismiss()
    }
    
    var shouldLaunchCreation: Bool = false
    @objc func swipeToDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.frame = CGRect(x: UIScreen.main.bounds.maxX, y: 0, width: 230, height: UIScreen.main.bounds.height)

        } completion: { (done) in
            if done {
                if self.shouldLaunchCreation {
                    self.hostVC?.launchCharacterCreation()
                }
                self.removeFromSuperview()
                self.willMove(toSuperview: nil)
            }
        }
    }
    
    
}
