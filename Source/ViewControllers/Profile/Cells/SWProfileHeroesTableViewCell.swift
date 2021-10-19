//
//  SWProfileHeroesTableViewCell.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/30/21.
//

import UIKit

class SWProfileHeroesTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var heroes: [HeroModel] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(UINib(nibName: "SWProfileHeroCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SWProfileHeroCollectionViewCell")
        databaseManager.getHeroesForUser(userSlug: userManager.currentUser?.slug ?? "") { heroes, error in
            if error != nil {
                
            }else {
                self.heroes = heroes
            }
            self.collectionView.reloadData()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: SWProfileHeroCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SWProfileHeroCollectionViewCell", for: indexPath) as? SWProfileHeroCollectionViewCell {
            let hero = heroes[indexPath.row]
            if indexPath.row < heroes.count {
                let image = databaseManager.getImageFromStorage(imageName: hero.imageName ?? "") { image, error in
                    cell.heroImageView.image = image
                }
                cell.heroNameLabel.text = (hero.heroName ?? "")
                cell.heroLevelLabel.text = hero.getLevelString()
            }else {
                cell.heroImageView.image = UIImage(systemName: "plus")
                cell.heroImageView.tintColor = UIColor(named: "SWStrength_Vigor")
                cell.backgroundColor = UIColor.darkGray
                cell.heroNameLabel.isHidden = true
                cell.heroLevelLabel.isHidden = true
            }
        }
        
        
        return UICollectionViewCell()
    }
    
    
}
