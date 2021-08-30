//
//  SWHeroViewController.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 8/21/21.
//

import UIKit

class SWHeroViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var SAMImageView: UIImageView!
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var editHeroButton: UIButton!
    @IBOutlet weak var changeHeroButton: UIButton!
    @IBOutlet weak var paceLabel: UILabel!
    @IBOutlet weak var parryLabel: UILabel!
    @IBOutlet weak var toughnessLabel: UILabel!
    @IBOutlet weak var toughnessArmorLabel: UILabel!
    @IBOutlet weak var actionsButton: UIButton!
    @IBOutlet weak var conditionsButton: UIButton!
    @IBOutlet weak var woundsLabel: UILabel!
    @IBOutlet weak var woundsView: UIView!
    @IBOutlet weak var shakenButton: UIButton!
    @IBOutlet weak var hinderancesTableView: UITableView!
    @IBOutlet weak var edgesTableView: UITableView!
    
    @IBOutlet weak var traitsButton: UIButton!
    @IBOutlet weak var gearButton: UIButton!
    @IBOutlet weak var powersButton: UIButton!
    @IBOutlet weak var switchContainerView: UIView!
    
    var currentSwitchSelection: Int = 0 {
        didSet {
            switch currentSwitchSelection {
            case 0:
                print(currentSwitchSelection)
            case 1:
                print(currentSwitchSelection)
            default:
                print(currentSwitchSelection)
            }
        }
    }
    
    var tabViews: [UIView] = []
    var heroesArray: [HeroModel] = []
    var hero: HeroModel? {
        didSet {
            let heroImage = databaseManager.getImageFromStorage(imageName: hero?.imageName ?? "") { (image, error) in
                if error != nil {
                    self.heroImageView.image = UIImage(named: "")
                }else {
                    self.heroImageView.image = image
                }
            }
            
            heroNameLabel.text = (hero?.firstName ?? "") + " " + (hero?.lastName ?? "")
            paceLabel.text = "\(hero?.pace ?? 6)"
            parryLabel.text = "\(hero?.parry ?? 0)"
            toughnessLabel.text = "\(hero?.toughness)"
            hinderancesTableView.reloadData()
            edgesTableView.reloadData()
            setViewInContainer(index: 0)
            //toughnessArmorLabel.text = "\(hero?.armor)"
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dismissTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        self.SAMImageView.addGestureRecognizer(dismissTap)
        self.SAMImageView.isUserInteractionEnabled = true
        
        editHeroButton.layer.cornerRadius = 8
        editHeroButton.layer.borderColor = colors.buttonBorder.cgColor
        editHeroButton.layer.borderWidth = 1
        editHeroButton.backgroundColor = colors.buttonBackground
        
        changeHeroButton.layer.cornerRadius = 8
        changeHeroButton.layer.borderColor = colors.buttonBorder.cgColor
        changeHeroButton.layer.borderWidth = 1
        changeHeroButton.backgroundColor = colors.buttonBackground
        
        actionsButton.layer.cornerRadius = 8
        actionsButton.layer.borderColor = colors.buttonBorder.cgColor
        actionsButton.layer.borderWidth = 1
        actionsButton.backgroundColor = colors.buttonBackground
        
        conditionsButton.layer.cornerRadius = 8
        conditionsButton.layer.borderColor = colors.buttonBorder.cgColor
        conditionsButton.layer.borderWidth = 1
        conditionsButton.backgroundColor = colors.buttonBackground
        
        shakenButton.layer.cornerRadius = 8
        shakenButton.layer.borderColor = colors.buttonBorder.cgColor
        shakenButton.layer.borderWidth = 1
        shakenButton.backgroundColor = colors.buttonBackground
        
        woundsView.layer.cornerRadius = 8
        woundsView.layer.borderColor = colors.buttonBorder.cgColor
        woundsView.layer.borderWidth = 1
        woundsView.backgroundColor = colors.buttonBackground
        
        hinderancesTableView.delegate = self
        hinderancesTableView.dataSource = self
        hinderancesTableView.tag = 0
        hinderancesTableView.register(UINib(nibName: "HinderanceEdgeTableViewCell", bundle: nil), forCellReuseIdentifier: "HinderanceEdgeTableViewCell")
        
        edgesTableView.delegate = self
        edgesTableView.dataSource = self
        edgesTableView.tag = 1
        edgesTableView.register(UINib(nibName: "HinderanceEdgeTableViewCell", bundle: nil), forCellReuseIdentifier: "HinderanceEdgeTableViewCell")
        
        let traitsView: HeroTraitsView = HeroTraitsView(frame: self.switchContainerView.bounds)
        traitsView.skills = hero?.skills ?? [SkillModel]()
        self.tabViews = [traitsView]
        
        for slug in userManager.currentUser?.heroSlugs ?? [String]() {
            databaseManager.getHeroFromSlug(slug: slug) { (hero, error) in
                if let heroObject = hero as? HeroModel {
                    if heroObject.isCurrentHero {
                        self.hero = hero
                    }
                    self.heroesArray.append(heroObject)
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return hero?.hinderances.count ?? 0
        }else {
            return hero?.edges.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: HinderanceEdgeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HinderanceEdgeTableViewCell") as? HinderanceEdgeTableViewCell{
            if tableView.tag == 1 {
                cell.titleLabel.text = hero?.edges[indexPath.row].title
            }else {
                cell.titleLabel.text = hero?.hinderances[indexPath.row].title
                cell.hinderanceStrengthLabel.text = hero?.hinderances[indexPath.row].level
            }
            cell.titleLabel.textColor = .white
            cell.hinderanceStrengthLabel.textColor = .white
            cell.backgroundColor = colors.buttonBackground
            cell.layer.cornerRadius = 8
            return cell
        }
        return UITableViewCell()
    }
    
    func setViewInContainer(index: Int) {
        switch index {
        case 0:
            //Traits
            let traitsView: HeroTraitsView = HeroTraitsView(frame: CGRect(x: 0, y: 0, width: self.switchContainerView.frame.width, height: self.switchContainerView.frame.height))
            traitsView.skills = hero?.skills ?? [SkillModel]()
            self.switchContainerView.addSubview(traitsView)
        default:
        print("Default")
        }
        
    }
    
    
    @objc func dismissView() {
        UIView.animate(withDuration: 0.3) {
            self.view.alpha = 0
        } completion: { (done) in
            self.dismiss(animated: false, completion: nil)

        }
        
    }

}
