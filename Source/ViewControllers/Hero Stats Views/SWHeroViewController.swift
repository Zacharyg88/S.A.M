//
//  SWHeroViewController.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 8/21/21.
//

import UIKit

class SWHeroViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HeroItemDetailDelegate {

    @IBOutlet weak var SAMImageView: UIImageView!
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroProfileView: UIView!
    @IBOutlet weak var heroLevelLabel: UILabel!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var globalPenaltyLabel: UILabel!
    @IBOutlet weak var editHeroButton: UIButton!
    @IBOutlet weak var paceLabel: UILabel!
    @IBOutlet weak var parryLabel: UILabel!
    @IBOutlet weak var toughnessLabel: UILabel!
    @IBOutlet weak var toughnessArmorLabel: UILabel!
    @IBOutlet weak var actionsButton: UIButton!
    @IBOutlet weak var conditionsButton: UIButton!
    @IBOutlet weak var conditionsBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var horizontalStackView: UIStackView!
    @IBOutlet weak var woundsLabel: UILabel!
    @IBOutlet weak var woundsView: UIView!
    @IBOutlet weak var woundsUpButton: UIButton!
    @IBOutlet weak var woundsDownButton: UIButton!
    @IBOutlet weak var shakenButton: UIButton!
    @IBOutlet weak var hinderancesTableView: UITableView!
    @IBOutlet weak var edgesTableView: UITableView!
    
    @IBOutlet weak var traitsButton: UIButton!
    @IBOutlet weak var gearButton: UIButton!
    @IBOutlet weak var powersButton: UIButton!
    @IBOutlet weak var switchContainerView: UIView!
    @IBOutlet weak var contentContainerHeight: NSLayoutConstraint!
    
    
    var isBound: Bool = false {
        didSet {
            if isBound {
                //self.hero?.pace = 0
                self.paceLabel.text = "0"
                self.paceLabel.textColor = .red
            }else {
                self.paceLabel.text = "\(self.hero?.pace ?? 0)"
                self.paceLabel.textColor = .white
            }
        }
    }
    var isDistracted: Bool = false {
        didSet {
            if oldValue != isDistracted {
                self.toggleGlobalPenalty(isOn: isDistracted, penaltyString: "-2 to All Actions")
            }
        }
    }
    var isEntangled: Bool = false
    var isExhausted: Bool = false
    var isFatigued: Bool = false
    var isIncapacitated: Bool = false {
        didSet {
            if oldValue != isIncapacitated {
                self.toggleGlobalPenalty(isOn: isIncapacitated, penaltyString: "Incapacitated! No Actions!")
            }
        }
    }
    var isStunned: Bool = false {
        didSet {
            if oldValue != isStunned {
                self.toggleGlobalPenalty(isOn: isStunned, penaltyString: "Prone, No Movement or Actions")
            }
        }
    }
    var isVulnerable: Bool = false {
        didSet {
            if oldValue != isVulnerable {
                self.toggleGlobalPenalty(isOn: isVulnerable, penaltyString: " +2 to All Actions Against!")
            }
            
        }
    }
    var hasGlobalPenalty: Bool = false
    var currentSwitchSelection: Int = 0
    var switchContainerViews:[UIView] = []
    var isShaken: Bool = false
    var woundCount: Int = 0 {
        didSet {
            self.woundsLabel.text = "\(woundCount)"
            var textColor = UIColor.white
            var stringSuffix = ""
            if woundCount > 0 {
                textColor = UIColor.red
                woundsDownButton.isHidden = false
                stringSuffix = " - \(woundCount)"
            }else {
                woundsDownButton.isHidden = true
            }
            paceLabel.textColor = textColor
            paceLabel.text = "\((hero?.pace ?? 0) - woundCount)"
            if let traitsView: HeroTraitsView = switchContainerViews[0] as? HeroTraitsView {
                traitsView.agilityDiceLabel.textColor = textColor
                traitsView.agilityDiceLabel.text = "d\(self.hero?.attributes[0].dice?.sides ?? 0)" + stringSuffix
                
                traitsView.smartsDiceLabel.textColor = textColor
                traitsView.smartsDiceLabel.text = "d\(self.hero?.attributes[1].dice?.sides ?? 0)" + stringSuffix
                
                traitsView.spiritDiceLabel.textColor = textColor
                traitsView.spiritDiceLabel.text = "d\(self.hero?.attributes[2].dice?.sides ?? 0)"  + stringSuffix
                
                traitsView.strengthDiceLabel.textColor = textColor
                traitsView.strengthDiceLabel.text = "d\(self.hero?.attributes[3].dice?.sides ?? 0)"  + stringSuffix
                
                traitsView.vigorDiceLabel.textColor = textColor
                traitsView.vigorDiceLabel.text = "d\(self.hero?.attributes[4].dice?.sides ?? 0)" + stringSuffix
            }
        }
    }
    var tabViews: [UIView] = []
    var heroesArray: [HeroModel] = []
    var hero: HeroModel? {
        didSet {
            let heroImage = databaseManager.getImageFromStorage(imageName: hero?.imageName ?? "") { (image, error) in
                if error != nil {
                    print("There was an error getting the image \(error)")
                    self.heroImageView.image = UIImage(named: "")
                }else {
                    self.heroImageView.image = image
                }
            }
            
            heroNameLabel.text = (hero?.firstName ?? "")
            if hero?.lastName != nil {
                heroNameLabel.text = (heroNameLabel.text ?? "") + " " + (hero?.lastName ?? "")
            }
            heroLevelLabel.text = hero?.getLevelString()
            
            paceLabel.text = "\(hero?.pace ?? 6)"
            parryLabel.text = "\(hero?.parry ?? 0)"
            toughnessLabel.text = "\(hero?.toughness ?? 0)"
            hinderancesTableView.reloadData()
            edgesTableView.reloadData()
            self.setViewsForContainer()
            self.traitsTapped(self)
        }
    }
    
    var actions: [String] = ["Defend", "Hold"]
    var conditions: [ConditionModel] {
        get {
            return ruleBook.conditions.conditions
        }
    }
    var activeConditions: [ConditionModel] = [] {
        didSet {
            setConditionalBooleans()
        }
    }
    var stackViewIsShown: Bool = false
    var currentStackHost: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        globalPenaltyLabel.isHidden = true
        let dismissTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        self.SAMImageView.addGestureRecognizer(dismissTap)
        self.SAMImageView.isUserInteractionEnabled = true
        
        heroProfileView.layer.cornerRadius = heroProfileView.frame.height / 2
        heroImageView.layer.cornerRadius = heroImageView.frame.height / 2
        heroImageView.layer.borderColor = UIColor(named: "SWBlue")?.cgColor
        heroImageView.layer.borderWidth = 2
        heroImageView.clipsToBounds = true
        let changeHeroTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeHeroTapped(_:)))
        heroProfileView.addGestureRecognizer(changeHeroTap)
        
        
        actionsButton.layer.cornerRadius = 8
        actionsButton.layer.borderColor = colors.buttonBorder.cgColor
        actionsButton.layer.borderWidth = 1
        actionsButton.backgroundColor = colors.buttonBackground
        
        conditionsButton.layer.cornerRadius = 8
        conditionsButton.layer.borderColor = colors.buttonBorder.cgColor
        conditionsButton.layer.borderWidth = 1
        conditionsButton.backgroundColor = colors.buttonBackground
        
        let conditionsHold: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleConditionsLongPress(_:)))
        conditionsHold.minimumPressDuration = 1
        self.conditionsButton.addGestureRecognizer(conditionsHold)
        
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
        hinderancesTableView.tag = 1
        hinderancesTableView.tableFooterView = UIView()
        hinderancesTableView.register(UINib(nibName: "HinderanceEdgeTableViewCell", bundle: nil), forCellReuseIdentifier: "HinderanceEdgeTableViewCell")
        
        edgesTableView.delegate = self
        edgesTableView.dataSource = self
        edgesTableView.tag = 0
        edgesTableView.tableFooterView = UIView()
        edgesTableView.register(UINib(nibName: "HinderanceEdgeTableViewCell", bundle: nil), forCellReuseIdentifier: "HinderanceEdgeTableViewCell")
        
        getHeroesFromDB()
        
    }
    func setConditionalBooleans() {
        if activeConditions.contains(self.getConditionFromName(name: "Bound")) {
            if !activeConditions.contains(self.getConditionFromName(name: "Vulnerable")) {
                activeConditions.append(self.getConditionFromName(name: "Vulnerable"))
            }
            self.isBound = true
        }else {
            self.isBound = false
        }
        
        self.isDistracted = activeConditions.contains(self.getConditionFromName(name: "Distracted"))
        if activeConditions.contains(self.getConditionFromName(name: "Entangled")) {
            self.isEntangled = true
            if !activeConditions.contains(self.getConditionFromName(name: "Distracted")) {
                activeConditions.append(self.getConditionFromName(name: "Distracted"))
            }
        }else {
            self.isEntangled = false
        }
        
        self.isFatigued = activeConditions.contains(self.getConditionFromName(name: "Fatigued"))
        self.isExhausted = activeConditions.contains(self.getConditionFromName(name: "Exhausted"))
        self.isIncapacitated = activeConditions.contains(self.getConditionFromName(name: "Incapacitated"))
        self.isShaken = activeConditions.contains(self.getConditionFromName(name: "Shaken"))
        if activeConditions.contains(self.getConditionFromName(name: "Stunned")) {
            self.isStunned = true
            if !activeConditions.contains(self.getConditionFromName(name: "Distracted")) {
                activeConditions.append(self.getConditionFromName(name: "Distracted"))
            }
        }else {
            self.isStunned = false
        }
        self.isVulnerable = activeConditions.contains(self.getConditionFromName(name: "Vulnerable"))
        
    }
    
    func setViewsForContainer() {
        let traitsView: HeroTraitsView = HeroTraitsView(frame: CGRect(x: 0, y: 0, width: self.switchContainerView.frame.width, height: self.switchContainerView.frame.height))
        
        let gearView: HeroGearView = HeroGearView(frame: CGRect(x: 0, y: 0, width: self.switchContainerView.frame.width, height: self.switchContainerView.frame.height))
        
        let powersView: HeroPowersView = HeroPowersView(frame: CGRect(x: 0, y: 0, width: self.switchContainerView.frame.width, height: self.switchContainerView.frame.height))
        powersView.currentPowerPoints = self.hero?.powerPoints ?? 0
        switchContainerViews = [traitsView, gearView, powersView]
    }
    
    func getHeroesFromDB() {
        self.heroesArray.removeAll()
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
        if self.heroesArray.isEmpty {
            self.heroNameLabel.text = "Tap here to start Creating your First Hero!"
            self.heroImageView.image = UIImage(named:"icon_add")?.imageWithTint(.white)
            
        }
    }
    func getConditionFromName(name: String) -> ConditionModel {
        for condition in conditions {
            if condition.title == name {
                return condition
            }
        }
        return ConditionModel()
    }
    
    @IBAction func increaseWoundCount(_ sender: Any) {
        self.woundCount += 1
    }
    @IBAction func decreseWoundCount(_ sender: Any) {
        self.woundCount -= 1
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
                cell.hinderanceStrengthLabel.isHidden = true
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView.tag == 0 {
            let hindrance: HindranceModel = hero?.hinderances[indexPath.row] ?? HindranceModel()
            self.showDetailForItem(object: hindrance)
        }else {
            let edge: EdgeModel = hero?.edges[indexPath.row] ?? EdgeModel()
            self.showDetailForItem(object: edge)
            
        }
    }
    
    @IBAction func editHeroTapped(_ sender: Any) {
    }
    
    func toggleGlobalPenalty(isOn: Bool, penaltyString: String?) {
        if isOn && !self.hasGlobalPenalty {
            self.hasGlobalPenalty = true
            self.globalPenaltyLabel.isHidden = false
            self.globalPenaltyLabel.text = penaltyString ?? ""
            self.heroProfileView.backgroundColor = .red
        }else {
            
            self.globalPenaltyLabel.isHidden = true
            self.heroProfileView.backgroundColor = UIColor(named: "SWBacking")
        }
    }
    
    @objc func changeHeroTapped(_ sender: Any) {
        let heroListView: SWHeroListView = SWHeroListView(frame: CGRect(x: UIScreen.main.bounds.maxX, y: 0, width: 230, height: UIScreen.main.bounds.height))
        heroListView.heroes = self.heroesArray
        self.view.addSubview(heroListView)
        self.view.bringSubviewToFront(heroListView)
        heroListView.layer.shadowOffset = CGSize(width: -8, height: 8)
        heroListView.layer.shadowColor = UIColor.black.cgColor
        heroListView.layer.shadowOpacity = 0.75
        heroListView.layer.shadowRadius = 8
        heroListView.hostVC = self
        UIView.animate(withDuration: 0.5) {
            heroListView.frame = CGRect(x: UIScreen.main.bounds.maxX - 230, y: 0, width: 230, height: UIScreen.main.bounds.height)
        }
        
    }
    var isPresentingConditionView: Bool = false
    @objc func handleConditionsLongPress(_ sender: UILongPressGestureRecognizer) {
        let conditionsView: SWHeroConditionActionSelectionView = SWHeroConditionActionSelectionView()
        conditionsView.hostVC = self
        if !isPresentingConditionView {
            conditionsView.conditions = self.conditions
            self.view.addSubview(conditionsView)
            self.view.bringSubviewToFront(conditionsView)
            conditionsView.animateToHalf()
            isPresentingConditionView = true
        }
    }
    
    @IBAction func actionTapped(_ sender: Any) {
        var xInset: CGFloat = 0.0
        if !stackViewIsShown {
            self.currentStackHost = "actions"
            self.horizontalStackView.isHidden = false
            actionsButton.layer.borderColor = UIColor(named: "SWGreen")?.cgColor
            for i in self.actions {
                let actionsLabel: UILabel = UILabel(frame: CGRect.zero)
                actionsLabel.font = UIFont(name: "Oxanium", size: 14)
                actionsLabel.text = i
                actionsLabel.textColor = .white
                actionsLabel.textAlignment = .center
                actionsLabel.clipsToBounds = true
                actionsLabel.backgroundColor = UIColor(named: "SWGreen")
                actionsLabel.frame = CGRect(x: xInset, y: 0, width: actionsLabel.intrinsicContentSize.width + 16, height: 24)
                xInset += actionsLabel.intrinsicContentSize.width + 24
                actionsLabel.layer.cornerRadius = 12
                self.horizontalStackView.addSubview(actionsLabel)
            }
            self.conditionsBottomConstraint.constant = 64
            stackViewIsShown = true
        }else {
            for view in self.horizontalStackView.subviews {
                view.removeFromSuperview()
            }
            if currentStackHost == "actions" {
                actionsButton.layer.borderColor = UIColor(named: "SWButton_Border")?.cgColor
                self.conditionsBottomConstraint.constant = 24
                self.horizontalStackView.isHidden = true
                stackViewIsShown = false
            }else {
                self.conditionsButton.layer.borderColor = UIColor(named: "SWButton_Border")?.cgColor
                self.currentStackHost = "actions"
                self.horizontalStackView.isHidden = false
                actionsButton.layer.borderColor = UIColor(named: "SWGreen")?.cgColor
                for i in self.actions {
                    let actionsLabel: UILabel = UILabel(frame: CGRect.zero)
                    actionsLabel.font = UIFont(name: "Oxanium", size: 14)
                    actionsLabel.text = i
                    actionsLabel.textColor = .white
                    actionsLabel.textAlignment = .center
                    actionsLabel.clipsToBounds = true
                    actionsLabel.backgroundColor = UIColor(named: "SWGreen")
                    actionsLabel.frame = CGRect(x: xInset, y: 0, width: actionsLabel.intrinsicContentSize.width + 16, height: 24)
                    xInset += actionsLabel.intrinsicContentSize.width + 24
                    actionsLabel.layer.cornerRadius = 12
                    self.horizontalStackView.addSubview(actionsLabel)
                }
            }
        }
        
    }
    
    @objc func activeConditionTapped(_ sender: UITapGestureRecognizer) {
        if let label: UILabel = sender.view as? UILabel {
            let condition = getConditionFromName(name: label.text ?? "")
            self.activeConditions.removeAll { (checkCondition) -> Bool in
                if condition.title == checkCondition.title {
                    return true
                }else {
                    return false
                }
            }
            sender.view?.superview?.removeFromSuperview()
        }else {
            if let plusImageView: UIImageView = sender.view as? UIImageView {
                let conditionsView: SWHeroConditionActionSelectionView = SWHeroConditionActionSelectionView()
                conditionsView.hostVC = self
                conditionsView.conditions = self.conditions
                self.view.addSubview(conditionsView)
                self.view.bringSubviewToFront(conditionsView)
                conditionsView.animateToHalf()
            }
        }
    }
    
    @IBAction func conditionsTapped(_ sender: Any) {
        var conditionCount = 0
        var xInset: CGFloat = 0.0
        var activeConditionTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(activeConditionTapped(_:)))
        if !stackViewIsShown {
            self.currentStackHost = "conditions"
            self.horizontalStackView.isHidden = false
            conditionsButton.layer.borderColor = UIColor(named: "SWRed")?.cgColor
            let plusImageView: UIImageView = UIImageView(frame: CGRect(x: xInset, y: 0, width: 24, height: 24))
            plusImageView.image = UIImage(systemName: "plus.circle")
            plusImageView.tintColor = .white
            plusImageView.addGestureRecognizer(activeConditionTap)
            plusImageView.isUserInteractionEnabled = true
            xInset = 36
            self.horizontalStackView.addSubview(plusImageView)
            for i in self.activeConditions {

                let actionsLabel: UILabel = UILabel(frame: CGRect.zero)
                actionsLabel.font = UIFont(name: "Oxanium", size: 14)
                actionsLabel.text = i.title
                actionsLabel.textAlignment = .center
                actionsLabel.textColor = .white
                actionsLabel.backgroundColor = UIColor(named: "SWRed")
                actionsLabel.layer.cornerRadius = 12
                actionsLabel.clipsToBounds = true
                actionsLabel.frame = CGRect(x: 0, y: 0, width: actionsLabel.intrinsicContentSize.width + 16, height: 24)
                actionsLabel.addGestureRecognizer(activeConditionTap)
                actionsLabel.isUserInteractionEnabled = true
                let conditionView: UIView = UIView(frame: CGRect(x: xInset, y: 0, width: actionsLabel.frame.width + 16, height: 24))
                let minusImageView: UIImageView = UIImageView(frame: CGRect(x: actionsLabel.frame.width - 6, y: 0, width: 12, height: 12))
                minusImageView.image = UIImage(systemName: "minus.circle")
                minusImageView.tintColor = .white
                conditionView.addSubview(actionsLabel)
                conditionView.addSubview(minusImageView)
                xInset += actionsLabel.intrinsicContentSize.width + 36
                self.horizontalStackView.addSubview(conditionView)
            }
            self.conditionsBottomConstraint.constant = 64
            stackViewIsShown = true
        }else {
            for view in self.horizontalStackView.subviews {
                view.removeFromSuperview()
            }
            if self.currentStackHost == "conditions" {
                conditionsButton.layer.borderColor = UIColor(named: "SWButton_Border")?.cgColor
                self.conditionsBottomConstraint.constant = 24
                self.horizontalStackView.isHidden = true
                stackViewIsShown = false
            }else {
                self.actionsButton.layer.borderColor = UIColor(named: "SWButton_Border")?.cgColor
                self.currentStackHost = "conditions"
                self.horizontalStackView.isHidden = false
                conditionsButton.layer.borderColor = UIColor(named: "SWRed")?.cgColor
                for i in self.conditions {
                    let actionsLabel: UILabel = UILabel(frame: CGRect.zero)
                    actionsLabel.font = UIFont(name: "Oxanium", size: 14)
                    actionsLabel.text = i.title
                    actionsLabel.textAlignment = .center
                    actionsLabel.textColor = .white
                    actionsLabel.backgroundColor = UIColor(named: "SWRed")
                    actionsLabel.layer.cornerRadius = 12
                    actionsLabel.clipsToBounds = true
                    actionsLabel.frame = CGRect(x: xInset, y: 0, width: actionsLabel.intrinsicContentSize.width + 16, height: 24)
                    xInset += actionsLabel.intrinsicContentSize.width + 24
                    self.horizontalStackView.addSubview(actionsLabel)
                }
                self.conditionsBottomConstraint.constant = 64
                stackViewIsShown = true
            }
        }
    }
    

    
    @IBAction func shakenTapped(_ sender: Any) {
        if isShaken {
            shakenButton.backgroundColor = UIColor(named: "SWBackground")
            self.isShaken = false
        }else {
            shakenButton.backgroundColor = UIColor(named: "SWShaken")
            self.isShaken = true
        }
    }
    
    @IBAction func traitsTapped(_ sender: Any) {
        if !(switchContainerViews.isEmpty ?? false) {
            traitsButton.backgroundColor = UIColor(named: "SWBacking")
            gearButton.backgroundColor = UIColor(named: "SWBackground")
            powersButton.backgroundColor = UIColor(named: "SWBackground")
            self.setViewInContainer(index: 0)
        }
    }
    
    @IBAction func gearTapped(_ sender: Any) {
        if !(switchContainerViews.isEmpty ?? false) {
            traitsButton.backgroundColor = UIColor(named: "SWBackground")
            gearButton.backgroundColor = UIColor(named: "SWBacking")
            powersButton.backgroundColor = UIColor(named: "SWBackground")
            self.setViewInContainer(index: 1)
        }
    }
    
    @IBAction func powersTapped(_ sender: Any) {
        if !(switchContainerViews.isEmpty ?? false) {
            traitsButton.backgroundColor = UIColor(named: "SWBackground")
            gearButton.backgroundColor = UIColor(named: "SWBackground")
            powersButton.backgroundColor = UIColor(named: "SWBacking")
            self.setViewInContainer(index: 2)
        }
    }
    
    func setViewInContainer(index: Int) {
        for view in self.switchContainerView.subviews {
            view.removeFromSuperview()
            view.willMove(toSuperview: nil)
        }
        switch index {
        case 0:
            //Traits
            if let traitsView: HeroTraitsView = switchContainerViews[0] as? HeroTraitsView {
                traitsView.skills = hero?.skills ?? [SkillModel]()
                traitsView.attributes = hero?.attributes ?? [AttributeModel]()
                self.switchContainerView.addSubview(traitsView)
            }
        case 1:
            // Gear
            if let gearView: HeroGearView = switchContainerViews[1] as? HeroGearView {
                var armorItems: [ArmorModel] = []
                var weaponsItems: [WeaponModel] = []
                var shieldItems: [ShieldModel] = []
                var itemItems: [ItemModel] = []
                
                for item in hero?.items ?? [NSObject]() {
                    if let armor = item as? ArmorModel {
                        armorItems.append(armor)
                    }
                    if let weapon = item as? WeaponModel {
                        weaponsItems.append(weapon)
                    }
                    if let shield = item as? ShieldModel {
                        shieldItems.append(shield)
                    }
                    if let itemObject = item as? ItemModel {
                        itemItems.append(itemObject)
                    }
                }
                
                gearView.armor = armorItems
                gearView.weapons = weaponsItems
                gearView.shields = shieldItems
                gearView.items = itemItems
                gearView.delegate = self
                gearView.goldCountLabel.text = "\(hero?.gold ?? 0)"
                self.switchContainerView.addSubview(gearView)
                gearView.tableView.reloadData()
            }
        
        default:
        print("Powers")
            if let powersView: HeroPowersView = switchContainerViews[2] as? HeroPowersView {
                powersView.powers = hero?.powers ?? [PowerModel]()
                powersView.ppCountLabel.text = "\(hero?.powerPoints ?? 0)"
                powersView.hostVC = self
                powersView.delegate = self
                self.switchContainerView.addSubview(powersView)
                powersView.tableView.reloadData()
            }
        }
        
    }
    
    func showDetailForItem(object: Any) {
        var detailView: HeroObjectDetailsView = HeroObjectDetailsView(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY, width: self.view.frame.width, height: UIScreen.main.bounds.height / 2))
        
        if let weapon: WeaponModel = object as? WeaponModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWRed")
            detailView.typeLabel.text = "Weapon"
            detailView.nameLabel.text = weapon.title ?? ""
            detailView.leftHeader1.text = "Damage"
            detailView.leftDescription1.text = weapon.damageString ?? ""
            detailView.rightHeader1.text = "ROF"
            detailView.rightDescription1.text = "\(weapon.rof ?? 0)"
            detailView.leftHeader2.text = "Range"
            detailView.leftDescription2.text = weapon.range ?? ""
            detailView.rightHeader2.text = "AP"
            detailView.rightHeader2.text = "\(weapon.ap ?? 0)"
            detailView.leftHeader3.text = "Notes"
            detailView.leftDescription3.text = weapon.notes ?? ""
            detailView.rightHeader3.text = "Weight"
            detailView.rightDescription3.text = "\(weapon.weight ?? 0) lbs"
            detailView.leftHeader4.text = weapon.classification ?? ""
            detailView.leftDescription4.text = weapon.notes ?? ""
            
        }
        if let armor: ArmorModel = object as? ArmorModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWBlue")
            detailView.typeLabel.text = "Armor"
            detailView.nameLabel.text = armor.title ?? ""
            detailView.leftHeader1.text = "Armor Value"
            detailView.leftDescription1.text = "+\(armor.armorRating ?? 0)"
            detailView.rightHeader1.text = "Weight"
            detailView.rightDescription1.text = "\(armor.weight ?? 0) lbs"
            detailView.leftHeader2.text = "Areas Protected"
            var protectedString = ""
            for area in armor.areasProtected {
                if protectedString == "" {
                    protectedString.append(area ?? "")
                }else {
                    protectedString.append(", " + area ?? "")
                }
            }
            detailView.leftDescription2.text = protectedString
            detailView.rightHeader2.isHidden = true
            detailView.rightDescription2.isHidden = true
            detailView.leftHeader3.text = "Notes"
            detailView.leftDescription3.text = armor.notes ?? ""
            detailView.rightHeader3.isHidden = true
            detailView.rightDescription3.isHidden = true
            detailView.leftHeader4.isHidden = true
            detailView.leftDescription4.isHidden = true
            
        }
        if let shield: ShieldModel = object as? ShieldModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWBlue")
            detailView.typeLabel.text = "Shield"
            detailView.nameLabel.text = shield.title ?? ""
            detailView.leftHeader1.text = "Shield Rating"
            detailView.leftDescription1.text = "+\(shield.cover ?? 0)"
            detailView.rightHeader1.text = "Weight"
            detailView.rightDescription1.text = "\(shield.weight ?? 0) lbs"
            detailView.leftHeader2.text = "Parry"
            detailView.leftDescription2.text = "+ \(shield.parry ?? 0) to parry"
            detailView.rightHeader2.isHidden = true
            detailView.rightDescription2.isHidden = true
            detailView.leftHeader3.text = "Notes"
            detailView.leftDescription3.text = shield.notes ?? ""
            detailView.rightHeader3.isHidden = true
            detailView.rightDescription3.isHidden = true
            detailView.leftHeader4.isHidden = true
            detailView.leftDescription4.isHidden = true
        }
        
        if let power: PowerModel = object as? PowerModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWPower")
            detailView.typeLabel.text = "Power"
            detailView.nameLabel.text = power.title ?? ""
            detailView.leftHeader1.text = "Range"
            detailView.leftDescription1.text = power.range ?? ""
            detailView.rightHeader1.text = "PP"
            detailView.rightDescription1.text = "\(power.powerPoints ?? 0)"
            detailView.leftHeader2.text = "Rank"
            detailView.leftDescription2.text = power.rank ?? ""
            detailView.rightHeader2.isHidden = true
            detailView.rightDescription2.isHidden = true
            detailView.leftHeader3.text = "Notes"
            detailView.leftDescription3.text = power.notes ?? ""
            detailView.rightHeader3.isHidden = true
            detailView.rightDescription3.isHidden = true
            detailView.leftHeader4.isHidden = true
            detailView.leftDescription4.isHidden = true
            
        }
        if let item: ItemModel = object as? ItemModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWBGreen")
            detailView.typeLabel.text = "Item"
            detailView.nameLabel.text = item.title ?? ""
            detailView.leftHeader1.text = "Notes"
            detailView.leftDescription1.text = item.notes
            detailView.rightHeader1.isHidden = true
            detailView.rightDescription1.isHidden = true
            detailView.leftHeader2.isHidden = true
            detailView.leftDescription2.isHidden = true
            detailView.rightHeader2.isHidden = true
            detailView.rightDescription2.isHidden = true
            detailView.leftHeader3.isHidden = true
            detailView.leftDescription3.isHidden = true
            detailView.rightHeader3.isHidden = true
            detailView.rightDescription3.isHidden = true
            detailView.leftHeader4.isHidden = true
            detailView.leftDescription4.isHidden = true
        }
        
        if let hindrance: HindranceModel = object as? HindranceModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWDry_Planet")
            detailView.typeLabel.text = "Hindrance"
            detailView.nameLabel.text = hindrance.title ?? ""
            detailView.leftHeader1.text = "Level"
            detailView.leftDescription1.text = hindrance.level ?? ""
            detailView.leftHeader2.text = "Summary"
            detailView.leftDescription2.text = hindrance.summary ?? ""
            
            detailView.rightHeader1.isHidden = true
            detailView.rightDescription1.isHidden = true
            detailView.rightHeader2.isHidden = true
            detailView.rightDescription2.isHidden = true
            detailView.leftHeader3.isHidden = true
            detailView.leftDescription3.isHidden = true
            detailView.rightHeader3.isHidden = true
            detailView.rightDescription3.isHidden = true
            detailView.leftHeader4.isHidden = true
            detailView.leftDescription4.isHidden = true
        }
        
        if let edge: EdgeModel = object as? EdgeModel {
            detailView.bannerView.backgroundColor = UIColor(named: "SWCore_Planet")
            detailView.typeLabel.text = "Edge"
            detailView.nameLabel.text = edge.title ?? ""
            detailView.leftHeader1.text = "Summary"
            detailView.leftDescription1.text = edge.summary ?? ""
            
            detailView.leftHeader2.isHidden = true
            detailView.leftDescription2.isHidden = true
            detailView.rightHeader1.isHidden = true
            detailView.rightDescription1.isHidden = true
            detailView.rightHeader2.isHidden = true
            detailView.rightDescription2.isHidden = true
            detailView.leftHeader3.isHidden = true
            detailView.leftDescription3.isHidden = true
            detailView.rightHeader3.isHidden = true
            detailView.rightDescription3.isHidden = true
            detailView.leftHeader4.isHidden = true
            detailView.leftDescription4.isHidden = true
        }
        
        self.view.addSubview(detailView)
        self.view.bringSubviewToFront(detailView)
        UIView.animate(withDuration: 0.5) {
            detailView.frame = CGRect(x: 0, y: UIScreen.main.bounds.maxY / 2, width: self.view.frame.width, height: UIScreen.main.bounds.height / 2)
        }
    }
    
    func launchCharacterCreation() {
        let characterCreationVC: SWHeroCreationViewController = SWHeroCreationViewController()
        characterCreationVC.modalPresentationStyle = .overCurrentContext
        characterCreationVC.heroViewController = self
        self.present(characterCreationVC, animated: true, completion: nil)
    }
    
    func activatePower(power: PowerModel) {
        if let powersView: HeroPowersView = switchContainerViews[2] as? HeroPowersView {
            powersView.currentPowerPoints -= (power.powerPoints ?? 0)
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
