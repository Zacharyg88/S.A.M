//
//  MainMenuViewController.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 8/25/21.
//

import UIKit

class MainMenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var SAMImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "SWCreateCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SWCreateCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2
        return CGSize(width: width, height: width * 0.80)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: SWCreateCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SWCreateCollectionViewCell", for: indexPath) as? SWCreateCollectionViewCell {
            switch indexPath.row {
            case 0:
                cell.titleLabel.text = "View Characters"
            case 1:
                cell.titleLabel.text = "View Missions"
            case 2:
                cell.titleLabel.text = "Menu Three"
            default:
                cell.titleLabel.text = "Menu Four"
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("Characters Cell Tapped")
            let VC: UIViewController = UIViewController()
            let scrollView = UIScrollView(frame: VC.view.bounds)
            
            
            let heroViewController: SWHeroViewController = SWHeroViewController()
            heroViewController.view.frame = UIScreen.main.bounds
            heroViewController.modalPresentationStyle = .fullScreen
            self.present(heroViewController, animated: false, completion: nil)
            
            
        case 1:
            print("Missions Cell Tapped")
        case 2:
            print("Menu 3 Cell Tapped")
        default:
            print("Menu 4 Cell Tapped")
        }
    }

}
