//
//  RulebookModel.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/1/21.
//

import Foundation
var ruleBook = RulebookModel()
class RulebookModel: NSObject {
    var attributes = Attributes()
    var skills = Skills()
    var races = Races()
    var hinderances = Hinderances()
    var edges = Edges()
    
    
}

class RB_Race: NSObject {
    var generalDescription: String?
    var raceSpecificTraits: String?
    var imageLocation: String?
    var title: String?
    
    convenience init(title: String?, generalDescription: String?, traits: String?, imageLocation: String?) {
        self.init()
        self.title = title
        self.generalDescription = generalDescription
        self.raceSpecificTraits = traits
        self.imageLocation = imageLocation
    }
}

class Races: NSObject {
    var generalDescription = """
Not every hero is human. Below are sample races common to many science fiction and fantasy settings. Use them as they are or modify them to fit your particular world. After these examples are guidelines for creating your own races as well.
        Note that the races allude to a lot of rules we haven’t explained yet. Just skim them for now and come back once you’ve got a grasp on the rest of the game.
"""
    override init() {
        super.init()
        racesArray = [Android, Aquarian, Avion, Dwarves, Elves, Half_Elves, Half_Folk, Humans, Rakashans, Saurians]
    }
    var racesArray: [RB_Race] = []
    var Android: RB_Race = RB_Race(title: "Android", generalDescription: """
        Androids are semi-organic beings created by advanced technology. The example here mimics humans in most ways and can generally pass for them when desired (and not examined by a physician). Their advanced neural network gives them artificial intelligence complete with individual personalities, quirks, and emotions just like any other sapient being.
        The android version presented here is a generic model. To create more specialized androids, use the custom racial abilities starting on page 18.

    """, traits: "Androids add +2 to recover from being Shaken, don’t breathe, ignore one level of Wound modifiers, and are immune to poison and disease. Constructs cannot heal naturally. Healing one requires the Repair skill, which takes one hour per current Wound level per attempt and is not limited to the “Golden Hour” (see page 96).", imageLocation: "/Images/SW_Android_Race.png")
    
    var Aquarian: RB_Race = RB_Race(title: "Aquarian", generalDescription: "From the crushing ocean depths come aquatic folk. They are thick and sturdy beneath the waves but often vulnerable in the dry air or searing heat of the surface.", traits: """
            AQUATIC: Aquarians cannot drown in water and move at their full Pace when swimming. See Movement on page 92 for normal swimming rates.
            DEPENDENCY: Aquarians must immerse them- selves in water one hour out of every 24 or become automatically Fatigued each day until they are Incapacitated. The day after Incapacitation from dehydration, they perish. Each hour spent in water restores one level of Fatigue.
            LOW LIGHT VISION: Aquarians are used to the darkness of the depths. They ignore penalties for Dim and Dark Illumination.
            TOUGHNESS: Life in the depths of their watery worlds has made aquarian flesh tough and resilient. Add +1 to their Toughness.
        """, imageLocation: "/Images/SW_Aquarian_Race.png")
    
    var Avion: RB_Race = RB_Race(title: "Avion", generalDescription: "Avions are humanoids with wings. They tend to be very slight of build owing to their hollow bones. Some are feathered while others are leathery or even scaled.", traits: """
            CAN’T SWIM: Avions’ wings are a hazard in water. They subtract 2 from Athletics (swimming) rolls and each inch moved in water costs them 3′′ of Pace.
            FLIGHT: Avions fly at Pace 12 per round. Use Athletics when maneuvering.
            FRAIL: Avions have −1 Toughness due to their hollow bones.
            KEEN SENSES: Avions are more perceptive than most. They begin with a d6 in Notice (instead of d4) and may raise the skill to d12 + 1.
            REDUCED PACE: Dependence on flight and bulky wings make avions slightly slower when walking. Decrease their walking Pace by 1 and their running die by one step.
        """, imageLocation: "/Images/SW_Avion_Race.png")
    
    var Dwarves: RB_Race = RB_Race(title: "Dwarf", generalDescription: """
        Dwarves are short but stout, hardy people who come from massive caverns or high mountains. They are a proud, warlike race, usually made so by frequent contact with hostile races such as orcs and goblins.
        Dwarves usually live upwards of 200 years. In most fantasy campaigns, they have ruddy skin and all human hair colors.
""", traits:    """
        LOW LIGHT VISION: Dwarven eyes are accustomed to the dark of the underearth. They ignore penalties for Dim and Dark Illumination.
        REDUCED PACE: Dwarves have short legs compared to most races. Decrease their Pace by 1 and their running die one die type.
        TOUGH: Dwarves are stout and tough. They start with a d6 Vigor instead of a d4. This increases maximum Vigor to d12 + 1.
""", imageLocation: "/Images/SW_Dwarf_Race.png")
    
    var Elves: RB_Race = RB_Race(title: "Elf", generalDescription: "Elves are tall, thin souls with pointed ears and deep-set eyes of various colors. Whether they hail from the deep forests or hidden valleys, they are all born more graceful than humans, though somewhat slighter. Most elves live upwards of 300 years. They have fair skin and their hair includes all human colors, plus shades of silver, blue, and gold.", traits: """
             AGILE: Elves are graceful and agile. They start with a d6 in Agility instead of a d4. This increases maximum Agility to d12+1.
             ALL THUMBS: Elves have an inherent dislike of mechanical objects, and thus have the All Thumbs Hindrance. They shun most mechanical items and designs.
             LOW LIGHT VISION: Elven eyes amplify light. Other races often claim they can see stars in the elves’ eyes. They ignore penalties for Dim and Dark Illumination.
        """, imageLocation: "/Images/SW_Elf_Race.png")
    
    var Half_Elves: RB_Race = RB_Race(title: "Half Elf", generalDescription: "Half-elves gain the elves’ grace but none of their elegant frailty. Most are well-adjusted, but some are shunned by one side of the family or the other and grow resentful. Others may even be mistreated. Their lifespans are closer to their human parent than those of their elven kin, living  only to about 100 years.", traits: """
             HERITAGE: Half-elves may retain the grace of their elven parent or the adaptability of their human ancestry. A half-elf may either start with a free Novice Edge of his choice or a d6 in Agility instead of a d4 (which also increases his Agility maximum to d12 + 1).
             LOW LIGHT VISION: Half-elves ignore penalties for Dim and Dark Illumination.
             OUTSIDER (Minor): Half-elves are never quite comfortable in human or elven society, having a foot in both worlds but never fully standing in either. They subtract 2 from Persuasion rolls with all but others of their kind.
        """, imageLocation: "/Images/SW_Half_Elf_Race.png")
    
    var Half_Folk: RB_Race = RB_Race(title: "Half Folk", generalDescription: "Half-folk are small, nimble people with fuzzy brown or black hair. Though they are frail compared to most other races, their cheerful optimism (or wily cunning) gives them a “never say die” attitude that makes them more than a match for creatures twice their size. Half-folk see no reason to invite trouble and tend to live in their own close-knit communities far off the beaten path.", traits: """
            LUCK: Half-folk draw one additional Benny per game session.
            REDUCED PACE: Decrease the character’s Pace by 1 and their running die one die type.
            SIZE −1: Half-folk average only about four feet tall, reducing their Size (and therefore Toughness) by 1.
            SPIRITED: Half-folk are generally optimistic beings. They start with a d6 Spirit instead of a d4. This increases their maximum Spirit to d12 + 1.
        """, imageLocation: "/Images/SW_Half_Folk_Race.png")
    
    var Humans: RB_Race = RB_Race(title: "Human", generalDescription: """
            Humans in most settings get one free Edge of their choice. This option reflects their versatility and adaptability compared to most other races.
            For more variety, the GM might give humans abilities based on culture rather than race. For instance, a nomadic, horse- based society might start with skill points in Riding and Survival. Cultural templates are designed just like making new races, though GMs should allow for more exceptions than usual since the abilities tend to be learned rather than truly innate.
        """, traits: """
             ADAPTABLE: Humans begin play with any Novice Edge of their choosing. They must meet its Requirements as usual.
        """, imageLocation: "/Images/SW_Human_Race.png")
    
    var Rakashans: RB_Race = RB_Race(title: "Rakashan", generalDescription: """
            Rakashans are humanoid felines. Some have the bright colors of tigers, the speckled hides of leopards, or the exotic look of Siamese cats. All have sharp claws and teeth, and a cruel nature when it comes to dealing with their prey.
            Rakashans can be found in their own remote and exotic cities or as fringe elements of normal society. They are often too clever and beautiful to be shunned, but too cunning to gain others’ complete trust.
        """, traits: """
            AGILE: Feline grace gives rakashans a d6 Agility attribute instead of a d4. This increases maximum Agility to d12 + 1.
            BITE/CLAWS: Rakashan fangs and claws are Natural Weapons (page 104) that cause Strength+d4 damage.
            BLOODTHIRSTY: Rakashans can be cruel to their foes, often toying with them for simple amusement. They rarely take prisoners and feel little compunction about punishing captured foes.
            CAN’T SWIM: Rakashans actually can swim, they just shun it and are not particularly good at it. They subtract 2 from Athletics (swimming) rolls and each tabletop inch of movement in water uses 3′′ of Pace.
            LOW LIGHT VISION: Rakashan eyes amplify light. They ignore penalties for Dim and Dark Illumination.
            RACIAL ENEMY: Rakashan society rose at the expense of another. Pick a common race in your setting. Members of each culture subtract 2 from Persuasion when dealing with each other and often attack on sight.
        """, imageLocation: "/Images/SW_Rakashan_Race.png")
    
    var Saurians: RB_Race = RB_Race(title: "Saurian", generalDescription: "Lizard men typically come from steaming jungles or deep deserts where they have unique civilizations unknown to other sentient races.", traits: """
            ARMOR +2: Saurians have scaly skin that acts as leather armor.
             BITE: A saurian’s fangs are Natural Weapons (page 104) that cause Strength+d4 damage.
             ENVIRONMENTAL WEAKNESS: Though not truly cold-blooded, saurians are poorly suited for frigid conditions. They suffer a −4 penalty to resist cold environmental effects, and suffer +4 damage from cold-based attacks.
            KEEN SENSES: Saurians have acute senses, giving them the Alertness Edge.
            OUTSIDER (Minor): Most races distrust saurians for some reason. Perhaps it is their strange ways and customs, their often-sibilant speech, or an ancient subconscious fear of their reptilian ancestors. Saurians subtract 2 from Persuasion rolls with all but others of their kind.
        """, imageLocation: "/Images/SW_Saurian_Race.png")
}

class Attributes: NSObject {
    
    var generalDescription = """
Attributes don’t directly affect skill rolls. Savage Worlds treats learned knowledge and training as the most relevant and direct factors. A high attribute allows one to increase a skill faster and opens up options to Edges that greatly differentiate two characters with the same skill.
    Every character starts with a d4 in each of five attributes
"""
    var Agility = "Agility is a measure of a character’s nimble- ness, dexterity, and general coordination."
    var Smarts = "Smarts measures raw intelligence, mental acuity, and how fast a heroine thinks on her feet. It’s used to resist certain types of mental and social attacks"
    var Spirit = "Spirit is self-confidence, backbone, and willpower. It’s used to resist social and supernatural attacks as well as fear."
    var Strength = "Strength is physical power and fitness. It’s also used as the basis of a warrior’s damage in hand-to-hand combat, and to determine how much he can wear or carry."
    var Vigor = "Vigor represents an individual’s endurance, resistance to disease, poison, or toxins, and how much physical damage she can take before she can’t go on. It is most often used to resist Fatigue effects, and as the basis for the derived stat of Toughness."
}

class Skills: NSObject {
    
    var generalDescription = """
Heroes have 12 points to buy skills during character creation. A skill that’s below the linked attribute (noted in parentheses beside the skill name) is cheaper to increase than one that’s at or above it. See page 55 for Character Creation and page 54 for
Advancement.
Core skills are marked with a red star, and
start at d4 for player characters (see page 10).
Characters can attempt skills they don’t have but it’s more difficult. See Unskilled
Attempts on page 89.
"""
    var skills: [RB_Skill] = []
    override init() {
        super.init()
        skills = [Academics, Athletics, Battle, Boating, Common_Knowledge, Driving, Electronics, Faith, Fighting, Focus, Gambling, Hacking, Healing, Intimidation, Language, Notice, Occult, Performance, Persuasion, Piloting, Psionics, Repair, Research, Riding, Science, Shooting, Spellcasting, Stealth, Survival, Taunt, Thievery, Weird_Science]
        
    }
    
    var Academics: RB_Skill = RB_Skill(summary: "Academics reflects knowledge of the liberal arts, social sciences, literature, history, archaeology, and similar fields. If an explorer wants to remember when the Mayan calendar ended or cite a line from Macbeth, this is the skill to have.", attribute: "Smarts", title: "Academics")
    
    var Athletics: RB_Skill = RB_Skill(summary: "Athletics combines an individual’s coordin- ation with learned skills such as climbing, jumping, balancing, biking, wrestling, skiing, swimming, throwing, or catching. Characters who rely on physical power more than coordination can take the Brute Edge (page 38) to link this skill to Strength instead of Agility.", attribute: "Agility", title: "Athletics*")
    var Battle: RB_Skill = RB_Skill(summary: "Battle is an individual’s command of strategy and tactics. It can be used for general military knowledge and is critical when commanding troops in Mass Battles (see page 131).", attribute: "Smarts", title: "Battle")
    var Boating: RB_Skill = RB_Skill(summary: "Characters with this skill can handle most any boat or ship common to their setting. They also know how to handle common tasks associated with their vessel such as tying knots, rigging sails, or following currents.", attribute: "Agility", title: "Boating")
    var Common_Knowledge: RB_Skill = RB_Skill(summary: "Characters roll Common Knowledge to know people, places, and things of their world, including etiquette, geography, culture, popular technology, contacts, and customs.", attribute: "Smarts", title: "Common Knowledge*")
    var Driving: RB_Skill = RB_Skill(summary: """
Driving allows a hero to control any powered ground vehicle common to his setting. This includes cars, motorcycles, tanks, and the like.(Bikes and other self-powered transports use Athletics, beast-drawn transports use Riding.)
Characters in modern settings where vehicles are ubiquitous don’t need Driving for ordinary travel. Driving rolls are typically only needed in dangerous or stressful conditions, such as Chases (page 113).
""",
                                     attribute: "Agility", title: "Driving")
    var Electronics: RB_Skill = RB_Skill(summary: """
Electronics allows a hero to use complex or specialized devices such as the control panels on industrial machines or the sensor systems found on spaceships in futuristic settings.
Consumer or electronic devices common to the setting don’t require Electronics— Common Knowledge suffices if a roll is required at all. In the modern world, this applies to video recorders, cell phones, etc.
Fixing any type of broken electronic device uses the Repair skill (see page 34).
""", attribute: "Smarts", title: "Electronics")
    
    var Faith: RB_Skill = RB_Skill(summary: """
Faith is the arcane skill required for Arcane Background (Miracles), described
        on page 148.
""", attribute: "Spirit", title: "Faith")
    
    var Fighting: RB_Skill = RB_Skill(summary: "Fighting covers all hand-to-hand (melee) attacks, whether it’s with fists, axes, laser swords, or martial arts. See Chapter Three for the combat rules and the various maneuvers a warrior might attempt.", attribute: "Agility", title: "Fighting")
    
    var Focus: RB_Skill = RB_Skill(summary: "Focus is the arcane skill for Arcane Background (Gifted), see page 148.", attribute: "Spirit", title: "Focus")
    
    var Gambling: RB_Skill = RB_Skill(summary: """
Gambling is common in the saloons of the Old West, the back rooms of criminal organizations, the barracks of most armies, or the flight decks of scifi spaceships.
To simulate an hour of gambling without having to roll for every single toss of the dice or hand of cards, have everyone agree on the stakes, such as $10, 10 gold coins, etc. Everyone in the game then makes a Gambling roll. The lowest total pays the highest total the difference times the stake. The next lowest pays the second highest the difference times the stake, and so on. If there’s an odd man left in the middle, he breaks even.
Cheating: A character who cheats adds +2 to his roll. The GM may raise or lower this modifier depending on the particulars of the game or the method of cheating. If
a cheater rolls a Critical Failure, however, he’s caught. The consequences depend on the circumstances and who noticed, but are usually unpleasant!
""", attribute: "Smarts", title: "Gambling")
    
    var Hacking: RB_Skill = RB_Skill(summary: """
Hacking is the skill used to create programs and “hack” into secured systems. Use of this skill always requires a computer or interface of some sort.
Most tasks are a simple Hacking roll. The amount of time it takes is determined by the GM, from a single action to hours, days, or even months depending on the complexity of the project. Success means the attempt works as desired and a raise halves the time required. Failure usually just means the hacker must try again, while a Critical Failure may mean the system locks the user out, issues an alarm, or enacts another countermeasure of some sort.
""", attribute: "Smarts", title: "Hacking")
    
    var Healing: RB_Skill = RB_Skill(summary: """
Healing has multiple uses, from treating Wounds to diagnosing diseases and analyzing certain kinds of forensic evidence.
See page 96 for rules on mending and treating Wounds, and page 128 for treatment of disease or poison.
Forensics: Healing can also be used to analyze evidence that relates to anatomical trauma, including cause and time of death, angle of attack, and similar matters. Success provides basic information and a raise increases the details uncovered.
""", attribute: "Smarts", title: "Healing")
    
    var Intimidation: RB_Skill = RB_Skill(summary: """
Intimidation is the art of frightening an opponent so that he backs down, reveals information, or flees.
Intimidation is an opposed roll resisted by the opponent’s Spirit. In combat, this is a Test (see page 108). Out of combat, a successful roll means the foe backs down for the most part, reveals some information, or slinks away when the opportunity presents itselfA raise might mean he backs down for the remainder of the scene, spills all the beans, or runs away as fast as he can.
In or out of combat, a Critical Failure means the target is immune to this character’s Intimidation attempts for the remainder of this encounter!
Networking: Intimidation can also be used as a “macro” skill to simulate several hours of working the streets. See Networking on page 133 to see how to crack some heads for favors or information.
""", attribute: "Spirit", title: "Intimidation")
    
    var Language:RB_Skill = RB_Skill(summary: """
In some settings, such as those that focus on pulp action or “planetary romance” (where characters frequently travel among many strange civilizations), speaking various languages can simply be roleplayed with halting dialogue and campy accents that start out a little difficult and are quickly forgotten. The GM may ignore this skill altogether in these settings, or use the Multiple Languages Setting Rule on page 140.
In more realistic settings, communication can be a major barrier that requires characters to put skill points into additional languages. In a 1980s World War Three game, for example, a group of United Nations paratroopers won’t be able to speak with their foes unless they take Russian, Polish, or other languages common to the Warsaw Pact.
If the Language skill is in use, it should be listed as Language (Spanish), Language (American Sign Language), etc. A character’s die type also notes how fluent he is in it. (Characters start with a d8 in their own Language.)
Limited: Use whichever skill is lowest when performing an action that requires knowledge of a foreign language. Intimidation (if verbal), Persuasion, Research, Taunt, etc., are all limited by the character’s Language skill.
This limitation never applies to a character’s native tongue.
""", attribute: "Smarts", title: "Language")
    
    var Notice: RB_Skill = RB_Skill(summary: """
Notice is a hero’s general awareness and alertness. It’s used to sense sights, sounds, tastes, and smells, spot clues, detect ambushes, spot hidden weapons on a foe, or tell if a rival is lying, frightened, happy, etc.
Success conveys basic information—the character hears movement in the forest, smells distant smoke, or senses someone isn’t being completely truthful.
A raise grants more detail, such as the direction of a sound or odor or what topic a person is avoiding or lying about.
""", attribute: "Smarts", title: "Notice*")
    
    var Occult: RB_Skill = RB_Skill(summary: """
Occult reflects knowledge and experience with the paranormal most others don’t even believe exists. It can be used to decipher strange pictograms, recall information about supernatural creatures, remember cures for monstrous maladies like lycanthropy or vampirism, or perform rituals.
Finding information in a library, newspaper morgue, old tome, the internet, etc., uses the Research skill. As noted there, however, if the investigator’s Occult skill is higher she may use that instead. See Research on page 34.
""", attribute: "Smarts", title: "Occult")
    
    var Performance: RB_Skill = RB_Skill(summary: """
A good entertainer can lift the spirits, rally a crowd to action, or simply earn a few bucks from the locals. Specifics depend on the situation, setting, and how well the character is known in the area.
Performance covers singing, acting, playing an instrument, or similar tasks that require an audience to appreciate.
Raising Funds: The amount of money a character can raise by performing is extremely subjective, but as a general rule a successful performance raises 20% of the setting’s Starting Funds with a success and 30% with a raise. The GM can multiply this amount by the performer’s Rank if she feels it’s appropriate. These numbers work for typical performers who might be known in a small establishment or area. Larger performances can greatly boost the performer’s fee, but also require more time, energy, and setup.
Deception: Performance can be used instead of Persuasion if the character is attempting to deceive, bluff, or disguise herself and the GM agrees it makes sense in the context of the situation.
""", attribute: "Spirit", title: "Performance")
    
    var Persuasion: RB_Skill = RB_Skill(summary: """
Persuasion is the ability to convince others to do what you want through reason, cajoling, deception, rewards, or other friendly means. Persuasion isn’t mind control. It can change someone’s attitude but not their goals. A bandit may let you keep a sentimental piece of jewelry with a good Persuasion roll but still takes all your other goods.
When used to Support allies (page 106) it’s an unopposed roll. If the target is resistant, it’s an opposed roll vs. the target’s Spirit. The GM should modify the roll as she sees fit based on roleplaying, any pertinent Edges or Hindrances that affect the conversation, and the circumstances.
Reaction Level: How much a person is willing to cooperate depends largely on their attitude toward whoever’s talking to them. The Game Master can decide how nonplayer characters feel based on the setting, or roll on the Reaction Table (see sidebar) if she has no preconceived notions.
Success improves the target’s attitude one level and a raise improves it two. Further increases aren’t generally possible in the same encounter—it takes individuals a little time to adjust their biases.
Failure means the target won’t change his mind this scene or until the situation changes in some important way. A Critical Failure also reduces the target’s attitude two levels.
Only one roll should generally be allowed per interaction unless new information is revealed, a substantial reward is offered, etc.
Networking: Characters can also use Persuasion as a “macro skill,” simulating a few hours or an evening’s time hobnobbing and socializing to gain favors or information. See Networking on page 133.
""", attribute: "Spirit", title: "Persuasion*")
    
    var Piloting: RB_Skill = RB_Skill(summary: """
Piloting allows a character to maneuver airplanes, helicopters, jet packs, or spaceships. Rules for Chases and vehicular combat can be found in Chapter Four.
A being with the innate ability to fly (he has wings, for example) uses Athletics instead.
""", attribute: "Agility", title: "Piloting")
    
    var Psionics: RB_Skill = RB_Skill(summary: "This is the skill “psions” or “psis” use to activate and control their psionic abilities. See the Arcane Background (Psionics) Edge on page 148.", attribute: "Smarts", title: "Psionics")
    
    var Repair: RB_Skill = RB_Skill(summary: """
Repair is the ability to take apart and/or fix mechanical gadgets, vehicles, weapons, and simple electrical devices. It also covers the use of demolitions and explosives.
How long a Repair roll takes is up to the GM and the complexity of the task. Fixing a Wound on a compact car in a post-apocalyptic setting might take an hour. Fixing a Wound on the same car in the present day might take four hours if the character wants it painted, polished, etc. Success means the item is functional. A raise on the Repair roll halves the time required.
Tools: Characters suffer a minor penalty (−1 to −2) to their roll if they don’t have access to basic tools, or a major penalty (−3 to −4) if the device requires specialized equipment.
Electronics: Repair can be used to repair electronic devices, but is limited by the hero’s Electronics skill. Use whichever skill is lowest.
""", attribute: "Smarts", title: "Repair")
    
    var Research: RB_Skill = RB_Skill(summary: """
A character skilled in Research knows how to make good use of libraries, newspaper morgues, the internet, or other written sources of information.
The amount of time this takes is up to the GM and the situation. Finding something on the internet or a specific passage in a book might be possible in a combat round. Looking through books in a library, searching the internet for a complex topic, or digging up background information on an individual usually takes about an hour.
Success finds basic information and a raise provides more detail. Failure means the researcher doesn’t find what she’s looking for.
A Critical Failure might mean the researcher finds plausible but incorrect information, triggers the notice of some opposed entity or faction, reads something “Humanity Was Not Meant to Know” and suffers a mental illness of some sort (a Minor Phobia, Quirk, etc.), or she might even accidentally destroy the source. The GM is encouraged to be creative when such a mishap occurs, perhaps forcing the party to approach the situation in a different way.
Related Skills: If a character has a skill that relates directly to the subject he’s researching, he can use that instead of Research. An explorer with Occult d10 and Research d6, for example, rolls a d10 when investigating vampire lore at a forgotten library. If he later goes to search for the deed to a house where the vampires are rumored to lair, he rolls his normal Research instead.
Note: Research may only provide the clues, especially in a mystery-heavy game. Putting the clues together from the information gathered is up to the players.
""", attribute: "Smarts", title: "Research")
    
    var Riding: RB_Skill = RB_Skill(summary: "Riding allows a hero to mount, control, and ride any beast or beast-drawn vehicle common to his setting. This includes horses, camels, dragons, wagons, chariots, and the like. See the rules for Mounted Combat on page 103", attribute: "Agility", title: "Riding")
    
    var Science: RB_Skill = RB_Skill(summary: """
Those with this skill have studied various hard sciences such as biology, xenobiology, chemistry, geology, engineering, or any other
“hard” science.
A successful Science roll reveals basic information about a topic, and a raise grants more details.
""", attribute: "Smarts", title: "Science")
    
    var Shooting: RB_Skill = RB_Skill(summary: "Shooting covers all attempts to hit a target with a ranged weapon such as a bow, pistol, or rocket launcher (thrown weapons use Athletics, page 29). See Chapter Three for details on ranged combat.", attribute: "Agility", title: "Shooting")
    
    var Spellcasting: RB_Skill = RB_Skill(summary: "Mages, wizards, warlocks, and witches use Spellcasting to cast spells. See the Arcane Background (Magic) Edge on page 148.", attribute: "Smarts", title: "Spellcasting")
    
    var Stealth: RB_Skill = RB_Skill(summary: """
Stealth is the ability to hide and move quietly. A simple success on a Stealth roll means the character avoids detection if enemies aren’t particularly alert. If the character fails the roll, the enemy realizes something is amiss and begins actively searching for whatever
roused them.
Once foes are alerted and active, Stealth is opposed by Notice (a group roll if there are many foes, see page 89).
The GM should apply any circumstantial penalties to Notice rolls for darkness, cover, noise, distractions, and any difference in the target’s Scale (just like when attacking, see Scale on page 106). Sneaking through dry leaves might subtract 2 from the Stealth roll, for example, while spotting someone in the dark uses the Illumination penalty listed on page 102 (−4). Don’t apply the same modifier to both rolls, however. If Stealth is at −2 for the leaves, don’t give Notice a +2 for them as well.
Sneak Attack: Sneaking up close enough to make a melee attack always requires an opposed Stealth roll versus the target’s Notice, whether the guard is actively looking for trouble or not. If successful, the victim is
Vulnerable (page 100) to the attacker, but only until the attacker’s turn ends. With a raise, the attacker has The Drop (page 100) instead.
Movement: In combat, characters roll Stealth each turn as a free action at the end of their move or any action the GM thinks might draw attention.
Out of combat, the distance moved depends entirely on the situation. The GM might want a roll every minute if the group is sneaking around the perimeter of a defensive position, or every few miles if they’re trying to quietly walk the path through a dark forest without alerting the creatures that live there.
""", attribute: "Agility", title: "Stealth*")
    
    var Survival: RB_Skill = RB_Skill(summary: """
Survivalallowsacharactertofindfood,water, or shelter in hostile environments. It can also be used to navigate wilderness environments, figure out which plants are good to eat and which aren’t, and so on.
A successful Survival roll provides enough food and water for one person for one day; or five people with a raise.
More detailed information on Hunger and Thirst can be found under Hazards on page 125.
Tracking: Survival can also be used to detect and follow tracks. Each roll generally covers following the tracks for one mile, but the GM should adjust this as needed for specific circumstances.
The Game Master should assign a bonus or penalty based on the target, environment, and time. Tracking a large group that recently passed through a snow-covered area might grant a bonus of +4, while following a single person over rocks and streams after more than a day incurs a −4 penalty.
""", attribute: "Smarts", title: "Survival")
    
    var Taunt: RB_Skill = RB_Skill(summary: """
Taunt attacks a person’s pride through ridicule, cruel jests, or oneupmanship.
Taunt is an opposed roll resisted by the opponent’s Smarts. In combat, this is a Test (see page 108).
Out of combat, success means the defender backs down, slinks away, or starts a fight. A raise might leave the victim cowed for the remainder of the scene, or make her storm out of the area fuming or even in tears, or attack her tormentor recklessly (perhaps with a Wild Attack on the first round of combat).
A Critical Failure means the target is immune to this character’s Taunts for the remainder of the encounter.
""", attribute: "Smarts", title: "Taunt")
    
    var Thievery: RB_Skill = RB_Skill(summary: """
Lockpicking, safecracking, picking pockets, sleight of hand, setting and disabling traps and similar acts of misdirection, sabotage, subterfuge, and manipulation are called Thievery.
If used to pick a lock, crack a safe, disable a trap, or perform a simple unopposed action, success opens or disables the device, and a raise does it in less time, without tripping alarms, or whatever else the GM feels is appropriate.
Sleight of hand, hiding or planting an item, or picking a pocket require a simple success. If foes are actively watching the character, Thievery is opposed by Notice.
The Game Master should assign penalties for particularly difficult circumstances. Picking a heavy padlock might have a −4 penalty, while hiding a revolver in bulky winter clothing might grant a +1 bonus. Failure typically means the character is spotted or it takes too much time (after which the character can try again). A Critical Failure typically sets off the trap, alerts the victim, or jams the device so that it must be opened or interacted with in a different way.
Limited: Using Thievery on an electronic device, such as a keypad, is limited by the thief’s Electronics skill. Use the lowest of the two skills.
""", attribute: "Agility", title: "Thievery")
    
    var Weird_Science: RB_Skill = RB_Skill(summary: """
“Mad” scientists, inventors in worlds with magic (or technology far beyond our own), alchemists, or artificers can be found throughout many Savage Worlds.
Though their techniques may vary, all use Weird Science as their arcane skill. See the Arcane Background (Weird Science) Edge on page 148 to learn more of their wondrous ways.
""", attribute: "Smarts", title: "Weird Science")
    
}
class RB_Skill: NSObject {
    var title = ""
    var summary = ""
    var attribute = ""
    
    override init() {
        super.init()
    }
    
    
    convenience init(summary: String, attribute: String, title: String) {
        self.init()
        self.summary = summary
        self.attribute = attribute
        self.title = title
    }
}


class Hinderances: NSObject {
    
    var Hinderances: [HindranceModel] = []
    
    override init() {
        super.init()
        Hinderances = [All_Thumbs, Anemic, Arrogant, Bad_Eyes, Bad_Luck, Big_Mouth, Blind, Bloodthirsty, Cant_Swim, Cautious, Clueless, Clumsy, Code_of_Honor, Curious, Deathwish, Delusional,Doubting_Thomas, Driven, Elderly, Enemy, Greedy, Habit, Hard_of_Hearing, Heroic, Hesitant, Illiterate, Impulsive, Jealous, Loyal, Mean, Mild_Mannered, Mute, Obese, Obligation, One_Arm, One_Eye, Outsider, Overconfident, Pacifist, Phobia, Poverty, Quirk, Ruthless, Secret, Shamed, Slow, Small, Stubborn, Suspicious, Thin_Skinned, Tongue_Tied, Ugly, Vengeful, Vow, Wanted, Yellow, Young]
    }
    var generalDescription = """
    Constructs are designed with a particular purpose. Player character constructs have broad directives such as serving a particular corporation or political faction. This acts as a Major Vow to that particular directive. If this ever causes a conflict of interest, the player and GM must figure out what the construct’s programming requires.
    """
    
    var All_Thumbs: HindranceModel = HindranceModel().generateModelFromDict(data: [
        "title": "All Thumbs",
        "level": "Minor",
        "summary": """
        Due to upbringing, lack of exposure, or pure bad luck, some individuals are “all thumbs” when it comes to mechanical or technological devices.
        All Thumbs inflicts a −2 penalty when using mechanical or electrical devices. If he rolls a Critical Failure while using such a device (and it doesn’t already have a built-in effect), it’s broken. If the GM feels it’s appropriate, it can be fixed with a Repair roll and 1d6 hours
    """,
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": false,
            "modInt": 2,
            "attribute": "",
            "skill": "Mechanics, Electronics"
        ])
    ])
    
    var Anemic: HindranceModel = HindranceModel().generateModelFromDict(data: [
        "title": "Anemic",
        "level": "Minor",
        "summary": """
        Anemic characters are particularly susceptible to sickness, disease, environmental effects, and fatigue. They subtract 2 from Vigor rolls made to resist Fatigue (see Hazards, starting on page 125).
    """,
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": false,
            "modInt": 2,
            "attribute": "Vigor",
            "skill": ""
        ])
    ])
    
    var Arrogant: HindranceModel = HindranceModel().generateModelFromDict(data: [
        "title": "Arrogant",
        "level": "Major",
        "summary": """
        Your hero doesn’t think he’s the best—he knows he is. Whether it’s swordsmanship, kung fu, or painting, few compare to his skills and he flaunts it every chance he gets.
        Winning isn’t enough for this champion. He wants to dominate his opponent and prove there’s no one better. He’s the kind of fighter who disarms an opponent in a duel just to pick the sword up and hand it back with a smirk. Arrogant individuals look for the greatest threat in battle, hacking their way through lesser minions only because they’re in the way.
    """,
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": false,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Bad_Eyes: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Bad Eyes",
                                                                             "level": "Major or Minor",
                                                                             "summary": """
                                                                                    Your hero’s eyes aren’t what they used to be. He suffers a −1 penalty to any Trait roll dependent on vision (such as ranged attacks and Notice rolls) or −2 as a Major Hindrance.
                                                                                    In settings where glasses are available, they negate the penalty when worn. If lost or broken during a combat (generally a 50% chance when he’s Wounded, falls, or suffers some other trauma), the character is Distracted (and Vulnerable if a Major Hindrance) until the end of their next turn.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 2,
                                                                                "attribute": "",
                                                                                "skill": "Vision"
                                                                             ])
                                                                            ])
        
    var Bad_Luck: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Bad Luck",
                                                                             "level": "Major",
                                                                             "summary": """
                                                                                    Your hero is a little less lucky than most. He gets one less Benny per game session than normal. A character cannot have both Bad Luck and the Luck Edge.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 1,
                                                                                "attribute": "",
                                                                                "skill": "Bennies"
                                                                             ])
                                                                            ])
    
    var Big_Mouth: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Big Mouth",
                                                                             "level": "Minor",
                                                                             "summary": """
                                                                                    Loose lips sink ships, the saying goes. This hero’s mouth could drown an armada.
                                                                                    The blabbermouth can’t keep a secret very well. He reveals plans and gives away things best kept among friends, usually at the worst possible times.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Blind: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                        ["title": "Blind",
                                                                         "level": "Major",
                                                                         "summary": """
                                                                                The individual is completely without sight. He suffers a −6 to all physical tasks that require vision (GM’s call). On the plus side, Blind characters gain their choice of a free Edge to compensate for this particularly difficult Hindrance.
                                                                                """,
                                                                         "modifier": ModifierModel().generateModelFromDict(data:
                                                                        [
                                                                            "isPositive": false,
                                                                            "modInt": 6,
                                                                            "attribute": "",
                                                                            "skill": "All vision based tasks"
                                                                         ])
                                                                        ])
    
    var Bloodthirsty: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                                ["title": "Bloodthirsty",
                                                                                 "level": "Major",
                                                                                 "summary": """
                                                                                        Your hero never takes prisoners unless under the direct supervision of a superior. His cold-blooded ruthlessness causes enemies to respond in kind, often costs vital information, creates constant enemies, and may get him in trouble
                                                                                        with his superiors or the authorities, depending on the setting.
                                                                                        """,
                                                                                 "modifier": ModifierModel().generateModelFromDict(data:
                                                                                [
                                                                                    "isPositive": false,
                                                                                    "modInt": 0,
                                                                                    "attribute": "",
                                                                                    "skill": ""
                                                                                 ])
                                                                                ])
    
    var Cant_Swim:  HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                                ["title": "Can't Swim",
                                                                                 "level": "Major",
                                                                                 "summary": """
                                                                                        Most people in the 21st century can swim thanks to swimming pools, easy travel to lakes and beaches, or educational efforts. Historically, how- ever, those who weren’t raised around a temperate body of water could not.
                                                                                        Characters with this Hindrance suffer a −2 penalty to the Athletics skill when swimming and each inch moved in water costs 3′′ of Pace. See Movement (page 92) for more details and Drowning (page 126).
                                                                                        """,
                                                                                 "modifier": ModifierModel().generateModelFromDict(data:
                                                                                [
                                                                                    "isPositive": false,
                                                                                    "modInt": 2,
                                                                                    "attribute": "Athletics",
                                                                                    "skill": ""
                                                                                 ])
                                                                                ])
    
    var Cautious: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Cautious",
                                                                             "level": "Minor",
                                                                             "summary": """
                                                                                    This planner personifies restraint and carefulness. He never makes rash decisions and likes to plot things out in detail long before any action is taken.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Clueless: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Clueless",
                                                                             "level": "Major",
                                                                             "summary": """
                                                                                    Your hero doesn’t pay much attention to the world around him and can’t seem to find
                                                                                    a haystack in a small pile of needles. He suffers a −1 penalty to Common Knowledge and Notice rolls.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 1,
                                                                                "attribute": "",
                                                                                "skill": "Common Knowledge, Notice"
                                                                             ])
                                                                            ])
    
    var Clumsy: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Clumsy",
                                                                             "level": "Major",
                                                                             "summary": """
                                                                                    Your hero is an uncoordinated klutz who trips over air and is always the last one picked for sports. He subtracts 2 from Athletics and Stealth rolls.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 2,
                                                                                "attribute": "",
                                                                                "skill": "Athletics, Stealth"
                                                                             ])
                                                                            ])
    
    var Code_of_Honor: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                                ["title": "Code of Honor",
                                                                                 "level": "Major",
                                                                                 "summary": """
                                                                                        Honor is very important to your character. He keeps his word, doesn’t abuse or kill prisoners, and generally tries to operate within his world’s particular notion of proper gentlemanly or ladylike behavior.
                                                                                        """,
                                                                                 "modifier": ModifierModel().generateModelFromDict(data:
                                                                                [
                                                                                    "isPositive": false,
                                                                                    "modInt": 0,
                                                                                    "attribute": "",
                                                                                    "skill": ""
                                                                                 ])
                                                                                ])
    
    var Curious: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Curious",
                                                                             "level": "Major",
                                                                             "summary": """
                                                                                    It killed the cat, and it might kill your warrior as well. Curious characters have to check out everything and always want to know what’s behind a potential
                                                                                    mystery or secret.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Deathwish: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Deathwish",
                                                                             "level": "Minor",
                                                                             "summary": """
                                                                                    Having a death wish doesn’t mean your adventurer is suicidal—he might just think his life is worth less than some
                                                                                    noble but clearly deadly goal.
                                                                                    Those with a Death Wish don’t throw their lives away for no reason, but when there’s a chance to complete a goal they do anything—and take any
                                                                                    risk—to achieve it.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Delusional: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                                ["title": "Delusional",
                                                                                 "level": "Major, Minor",
                                                                                 "summary": """
                                                                                        Your hero believes something
                                                                                        that is considered quite strange by everyone else. Minor Delusions are harmless or the character generally keeps it to himself (the government puts sedatives in soft drinks, dogs can talk, we’re all just characters in some bizarre game, etc.).
                                                                                        With a Major Delusion, he expresses his view on the situation frequently and it can occasionally lead to danger
                                                                                        (the government is run by aliens, hospitals are deadly, I’m allergic to armor, zombies are my friends).
                                                                                        """,
                                                                                 "modifier": ModifierModel().generateModelFromDict(data:
                                                                                [
                                                                                    "isPositive": false,
                                                                                    "modInt": 0,
                                                                                    "attribute": "",
                                                                                    "skill": ""
                                                                                 ])
                                                                                ])
    
    var Doubting_Thomas: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                                    ["title": "Doubting Thomas",
                                                                                     "level": "Minor",
                                                                                     "summary": """
                                                                                            Some people don’t believe in the supernatural until they’re halfway down some creature’s gullet. Doubting Thomases are skeptics who try their best to rationalize supernatural events. They walk right into danger they don’t believe in and look for alternate explanations to every supernatural event.
                                                                                            Even after being confronted with undeniable truth, the doubter’s mind eventually begins to doubt what he saw, rationalizes it away, or compartmentalizestheeventas“oneofakind” while continuing to doubt the next mystery.
                                                                                            """,
                                                                                     "modifier": ModifierModel().generateModelFromDict(data:
                                                                                    [
                                                                                        "isPositive": false,
                                                                                        "modInt": 0,
                                                                                        "attribute": "",
                                                                                        "skill": ""
                                                                                     ])
                                                                                    ])
    
    var Driven: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Driven",
                                                                             "level": "Major, Minor",
                                                                             "summary": """
                                                                                    A vow is a commitment to others. Driven characters want something for themselves. It may be to protect the realm, become a deco- rated officer, prove you’re the best gladiator in Rome, or the best pilot in the galactic fleet.
                                                                                    The Minor version shapes the character and pushes his decisions but either happens rarely or is fairly harmless. As a Major Hindrance it’s an overriding desire that comes up frequently or causes peril for the heroine and those around her.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Elderly: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Elderly",
                                                                             "level": "Major",
                                                                             "summary": """
                                                                                    Your adventurer is getting on in years, but he’s not quite ready for the nursing home yet. His Pace is reduced by 1, and he subtracts 1 from running rolls (minimum 1). He also suffers a −1 penalty to Agility, Strength (including damage), and Vigor rolls, but not linked skills.
                                                                                    On the plus side, the wisdom of his years grants the hero 5 extra skill points which may be used for any skills linked to Smarts.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 1,
                                                                                "attribute": "",
                                                                                "skill": "Pace, Agility, Strength, Vigor"
                                                                             ])
                                                                            ])
    
    var Enemy: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                        ["title": "Enemy",
                                                                         "level": "Major, Minor",
                                                                         "summary": """
                                                                                Someone out there hates the character and wants him ruined, locked away, or dead. The value of the Hindrance depends on how powerful the enemy is and how often he might show up. A Minor Enemy might be a lone gunslinger out for vengeance or a betrayed brotherhood that’s deadly but appears rarely. A Major Enemy might represent powerful authorities, a band of outlaws, or a single very powerful and relentless rival.
                                                                                If the enemy is one day defeated, the GM should gradually work in a replacement, or the hero may buy off the Hindrance by sacrificing an Advance.
                                                                                """,
                                                                         "modifier": ModifierModel().generateModelFromDict(data:
                                                                        [
                                                                            "isPositive": false,
                                                                            "modInt": 0,
                                                                            "attribute": "",
                                                                            "skill": ""
                                                                         ])
                                                                        ])
    
    var Greedy: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Greedy",
                                                                             "level": "Major, Minor",
                                                                             "summary": """
                                                                                    A miser measures worth in material possessions or wealth. If a Minor Hindrance, he argues bitterly for more than his fair share of any loot or reward the party might come across. As a Major Hindrance, he fights over anything he considers unfair, and may even kill for it if he feels slighted or covets something he cannot have.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Habit: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                        ["title": "Habit",
                                                                         "level": "Major, Minor",
                                                                         "summary": """
                                                                                Your warrior has an annoying or dangerous compulsion. A Minor Habit irritates those around her but isn’t dangerous. Maybe she picks her nose, can’t stop fiddling with her phone, says “y’know” in the middle of every sentence, or chews and smacks her gum loudly and often. Allies avoid her if possible.
                                                                                A Major Habit is a physical or mental addiction of some sort that is debilitating or possibly even deadly. This includes drug use, chronic drinking, or perhaps even an addiction to virtual reality in a high- tech setting.
                                                                                An addict who doesn’t get his fix must make a Vigor roll every 24 hours he goes without or take a level of Fatigue (see page 100).
                                                                                Once every 24 hours, a Healing roll with some sort of appropriate medicine removes one level of Fatigue for four hours. After that the Fatigue returns and can only be recovered with the addicting substance.
                                                                                """,
                                                                         "modifier": ModifierModel().generateModelFromDict(data:
                                                                        [
                                                                            "isPositive": false,
                                                                            "modInt": 0,
                                                                            "attribute": "",
                                                                            "skill": ""
                                                                         ])
                                                                        ])
    
    var Hard_of_Hearing: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                                    ["title": "Hard of Hearing",
                                                                                     "level": "Major, Minor",
                                                                                     "summary": """
                                                                                            Characters who have lost some or all of their hearing have this disadvantage. As a Minor Hindrance, it subtracts 4 from all Notice rolls made to hear, including awaking due to loud noises. A Major Hindrance means the character is deaf. She cannot hear and automatically fails all Notice rolls that depend on hearing.
                                                                                            Hearing aids reduce the penalty by 2, but require batteries and have a 50% chance of falling out when he’s Wounded, falls, or suffers some other trauma.
                                                                                            """,
                                                                                     "modifier": ModifierModel().generateModelFromDict(data:
                                                                                    [
                                                                                        "isPositive": false,
                                                                                        "modInt": 4,
                                                                                        "attribute": "",
                                                                                        "skill": "Notice"
                                                                                     ])
                                                                                    ])
    
    var Heroic: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Heroic",
                                                                             "level": "Major",
                                                                             "summary": """
                                                                                    This noble soul never says no to a person in need. She doesn’t have to be happy about it, but she always comes to the rescue of those she feels can’t help themselves. She’s the first one to run into a burning building, usually agrees to hunt monsters for little or no pay, and is generally a pushover for a sob story.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Hesitant: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Hesitant",
                                                                             "level": "Minor",
                                                                             "summary": """
                                                                                    Your hero hesitates in stressful situations. Draw two Action Cards in combat and act on the lowest. If you draw a Joker, use it normally and ignore the Hindrance for the round (hence this being a Minor Hindrance, it actually increases your chances of drawing a Joker!)
                                                                                    Hesitant characters cannot take the Quick or Level Headed Edges.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Illiterate: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                                ["title": "Illiterate",
                                                                                 "level": "Minor",
                                                                                 "summary": """
                                                                                        Your hero cannot read. He can sign his name and knows what a STOP sign says, but little else. He also doesn’t know much about math. He can probably do 2 + 2 = 4, but multiplication and the like are beyond him.
                                                                                        Illiterate characters can’t read or write in any language, by the way, no matter how many they actually speak.
                                                                                        """,
                                                                                 "modifier": ModifierModel().generateModelFromDict(data:
                                                                                [
                                                                                    "isPositive": false,
                                                                                    "modInt": 0,
                                                                                    "attribute": "",
                                                                                    "skill": ""
                                                                                 ])
                                                                                ])
    
    var Impulsive: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Impuslive",
                                                                             "level": "Major",
                                                                             "summary": """
                                                                                    The daredevil almost always leaps before he looks. He rarely thinks things through before taking action.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Jealous: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Jealous",
                                                                             "level": "Major, Minor",
                                                                             "summary": """
                                                                                    Insecurity leads to envy of others’ accomplish- ments or being overly possessive of what this disgruntled soul feels belongs to him. He often complains, pouts, covets others’ possessions or accolades, claims credit for another’s work, disobeys commands, and generally causes problems.
                                                                                    As a Minor Hindrance, the character’s jealousy is focused on one particular subject (such as his “unrivaled” skill as a pilot or a romantic interest).
                                                                                    As a Major Hindrance, the character is jealous of anyone and everyone he feels outshines him. He consistently bad-mouths his rivals, tries to upstage them, or actively plots to discredit those who threaten his ego.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Loyal: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                        ["title": "Loyal",
                                                                         "level": "Minor",
                                                                         "summary": """
                                                                                This stalwart defender risks her life for her friends without hesitation. Some Loyal heroes may not act that way, but are the first to come to their friends’ rescue when they’re threatened.
                                                                                """,
                                                                         "modifier": ModifierModel().generateModelFromDict(data:
                                                                        [
                                                                            "isPositive": false,
                                                                            "modInt": 0,
                                                                            "attribute": "",
                                                                            "skill": ""
                                                                         ])
                                                                        ])
    
    var Mean: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                        ["title": "Mean",
                                                                         "level": "Minor",
                                                                         "summary": """
                                                                                This curmudgeon is ill-tempered and disagreeable. He has trouble doing anything kind for anyone else, must be paid for his troubles, and doesn’t accept awards or favors graciously. Besides the obvious roleplaying issues, Mean characters subtract 1 from Persuasion rolls.
                                                                                """,
                                                                         "modifier": ModifierModel().generateModelFromDict(data:
                                                                        [
                                                                            "isPositive": false,
                                                                            "modInt": 1,
                                                                            "attribute": "",
                                                                            "skill": "Persuasion"
                                                                         ])
                                                                        ])
    
    var Mild_Mannered: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                                ["title": "Mild Mannered",
                                                                                 "level": "Minor",
                                                                                 "summary": """
                                                                                        Your milquetoast just isn’t threatening. Maybe he’s a little doughy around the middle, has a kind face, or a soft voice. Whatever the issue, he has a hard time looking tough. He subtracts 2 when making Intimidation rolls.
                                                                                        """,
                                                                                 "modifier": ModifierModel().generateModelFromDict(data:
                                                                                [
                                                                                    "isPositive": false,
                                                                                    "modInt": 2,
                                                                                    "attribute": "",
                                                                                    "skill": "Intimidation"
                                                                                 ])
                                                                                ])
    
    var Mute: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                        ["title": "Mute",
                                                                         "level": "Major",
                                                                         "summary": """
                                                                                Due to trauma or birth, your character has lost the ability to speak. He can write messages to others when needed, use sign language, or some combination of visual communication.
                                                                                Vison-based communication may require a Notice roll to perceive correctly (illumination and similar penalties apply).
                                                                                """,
                                                                         "modifier": ModifierModel().generateModelFromDict(data:
                                                                        [
                                                                            "isPositive": false,
                                                                            "modInt": 0,
                                                                            "attribute": "",
                                                                            "skill": ""
                                                                         ])
                                                                        ])
    
    var Obese: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                        ["title": "Obese",
                                                                         "level": "Minor",
                                                                         "summary": """
                                                                                Those who carry their weight well have the Brawny Edge. Those who don’t are Obese. A character cannot be both Brawny and Obese, and this Hindrance can’t increase your Size above +3.
                                                                                An Obese hero’s Size (and therefore Toughness) increase by +1. His Pace is reduced by 1, and his running die one die type (minimum d4). Strength is considered one die type less (minimum d4) for armor and worn gear (not weapons). They may also have difficulty finding armor or clothing that fits or entering confined spaces.
                                                                                """,
                                                                         "modifier": ModifierModel().generateModelFromDict(data:
                                                                        [
                                                                            "isPositive": false,
                                                                            "modInt": 1,
                                                                            "attribute": "",
                                                                            "skill": "Pace"
                                                                         ])
                                                                        ])
    
    var Obligation: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                                ["title": "Obligation",
                                                                                 "level": "Major, Minor",
                                                                                 "summary": """
                                                                                        Your hero has a responsibility she must attend to on a daily or regular basis. It could be a job, volunteer work, taking care of family or friends, etc.
                                                                                        The Obligation consumes about 20 hours most weeks, or 40+ for the Major version. Exactly what that entails should be discussed between the player and the Game Master.
                                                                                        """,
                                                                                 "modifier": ModifierModel().generateModelFromDict(data:
                                                                                [
                                                                                    "isPositive": false,
                                                                                    "modInt": 0,
                                                                                    "attribute": "",
                                                                                    "skill": ""
                                                                                 ])
                                                                                ])
    
    var One_Arm: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "One Arm",
                                                                             "level": "Major",
                                                                             "summary": """
                                                                                    By birth or battle, your hero has lost an arm. Fortunately, his other arm is (now) his “good” one. Tasks that require two hands, such as some Athletics rolls (GM’s call) or using a two-handed weapon, suffer a −4 modifier.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 4,
                                                                                "attribute": "",
                                                                                "skill": "Athletics*"
                                                                             ])
                                                                            ])
    
    var One_Eye: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "One Eye",
                                                                             "level": "Major",
                                                                             "summary": """
                                                                                    This veteran lost an eye and has trouble with depth perception. He subtracts 2 from any Trait roll dependent on vision and more than 5′′ (10 yards) distant.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 2,
                                                                                "attribute": "",
                                                                                "skill": "Vision"
                                                                             ])
                                                                            ])
    
    var Outsider: HindranceModel = HindranceModel().generateModelFromDict(data: [
        "title": "Outsider",
        "level": "Major, Minor",
        "summary": """
            In a society made up of only a few types of people, your hero isn’t one of them. A Native American in a Western town, an alien in a scifi game of human marines, or a half-orc in a party of elves, dwarves, and humans are all examples. Locals are likely to raise prices on her, ignore pleas for help, and generally treat
            her as lower class.
            Outsiders subtract 2 from Persuasion rolls made to influence those who aren’t her own kind. The Major version also means the character has few or no legal rights in the main campaign area. She might be a different species among xenophobes, the civilization may be cruel and unenlightened toward strangers, or she might even be an artificial intelligence whose sapience isn’t acknowledged by the law.
            """,
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": false,
            "modInt": 2,
            "attribute": "",
            "skill": "Persuasion"
        ])
    ])
    
    var Overconfident: HindranceModel = HindranceModel().generateModelFromDict(data: [
        "title": "Overconfident",
        "level": "Major",
        "summary": """
            There’s nothing out there your hero can’t defeat. At least that’s what he thinks. He believes he can do most anything and never wants to retreat from a challenge. He’s not suicidal, but he certainly takes on more than common sense dictates.
            """,
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": false,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Pacifist: HindranceModel = HindranceModel().generateModelFromDict(data:
        ["title": "Pacifist",
         "level": "Major, Minor",
         "summary": """
                Your hero absolutely despises violence. Minor pacifism means he only fights when given no other choice and never allows the killing of prisoners or other defenseless victims.
                Major Pacifists won’t fight living characters under any circumstances. They may defend themselves, but won’t do anything to permanently harm sapient, living creatures. They may use nonlethal methods (see page 104), but only in self-defense or the defense of others. Note that undeniably evil creatures, undead, demons, and the like are fair game even for Major Pacifists!
                """,
         "modifier": ModifierModel().generateModelFromDict(data:
        [
            "isPositive": false,
            "modInt": 0,
            "attribute": "",
            "skill": ""
         ])
        ])
    
    var Phobia: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Phobia",
                                                                             "level": "Major, Minor",
                                                                             "summary": """
                                                                                    Phobias are overwhelming and irrational fears that plague a hero’s psyche.
                                                                                    Whenever a character is in the presence of his phobia (GM’s call, but generally sight), he subtracts 1 from all his Trait rolls if it’s a Minor Hindrance, and 2 if it’s Major.
                                                                                    Phobias shouldn’t be too obvious; everyone should be afraid of vampires, for example, so it’s not a phobia, it’s common sense. Instead, the phobia usually centers on some random element the mind associates with the event. Remember, phobias are irrational fears.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 2,
                                                                                "attribute": "",
                                                                                "skill": "All*"
                                                                             ])
                                                                            ])
    
    var Poverty: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Poverty",
                                                                             "level": "Minor",
                                                                             "summary": """
                                                                                    It’s said a fool and his money are soon parted. Your hero is one of them. He starts with half the usual money for your setting and just can’t seem to hang on to funds acquired after play begins. In general, the player halves his
                                                                                    total funds every game week.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Quirk: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                        ["title": "Quirk",
                                                                         "level": "Minor",
                                                                         "summary": """
                                                                                This individual has some minor foible that is usually humorous but can occasionally cause him real trouble. A swashbuckler may always try to slash his initials on his foes, a dwarf may brag constantly about his culture, or a snobby débutante might not eat, drink, or socialize with the lower class, for example.
                                                                                """,
                                                                         "modifier": ModifierModel().generateModelFromDict(data:
                                                                        [
                                                                            "isPositive": false,
                                                                            "modInt": 0,
                                                                            "attribute": "",
                                                                            "skill": ""
                                                                         ])
                                                                        ])
    
    var Ruthless: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Ruthless",
                                                                             "level": "Major, Minor",
                                                                             "summary": """
                                                                                    The fanatic will do most anything to accomplish her goals. As a Major Hindrance, she harms anyone and everyone who gets in her way. As a Minor Hindrance, she stops short of true harm to anyone except those who directly oppose her.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Secret: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Secret",
                                                                             "level": "Major, Minor",
                                                                             "summary": """
                                                                                    Your hero has a secret she keeps to protect herself or others. As a Minor Hindrance, the secret is troublesome but not life-threatening.
                                                                                    The Major version would cause severe problems if discovered. If it ever becomes public knowledge, she should trade it for Enemy, Shamed, Wanted, or another appropriate Hindrance approved by the GM.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Shamed: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Shamed",
                                                                             "level": "Major, Minor",
                                                                             "summary": """
                                                                                    Something haunts your adventurer. Maybe he made a vow he didn’t keep. Maybe he was defeated in an honorable fight and ordered the death of his foe anyway for some greater principle. Maybe he isn’t actually cowardly but once ran from a battle and left others to die.
                                                                                    As a Minor Hindrance, the shameful circumstances aren’t generally known—it just haunts the hero. He might go out of his way, against all reason, not to repeat the mistake. Or he might give in to the same set of circumstances and hate himself for it.
                                                                                    As a Major Hindrance, his deed is well- known—or at least known among those he cares about. The other player characters should be told the tale as soon as possible (preferably at character creation). If not, it should be revealed by nonplayer characters at some point, and occasionally used against the hero.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Slow: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                        ["title": "Shamed",
                                                                         "level": "Major, Minor",
                                                                         "summary": """
                                                                                A disability or past injury has hindered this hero’s mobility. As a Minor Hindrance, reduce his Pace by 1 and his running die one step (if already d4, reduce to d4 − 1 ). As a Major Hindrance, reduce the running die a step, Pace by 2, and subtract 2 from Athletics rolls and rolls to resist Athletics (such as Tests or Grappling).
                                                                                Slow characters may not take the Fleet- Footed Edge.
                                                                                """,
                                                                         "modifier": ModifierModel().generateModelFromDict(data:
                                                                        [
                                                                            "isPositive": false,
                                                                            "modInt": 2,
                                                                            "attribute": "",
                                                                            "skill": "Pace"
                                                                         ])
                                                                        ])
    
    var Small: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                        ["title": "Small",
                                                                         "level": "Minor",
                                                                         "summary": """
                                                                                This adventurer is very skinny, very short, or both. His Size (see page 106) is reduced by 1, which reduces his Toughness as well.
                                                                                Size can’t be reduced below −1, but the Toughness penalty remains. A Small half-folk, for example, remains Size −1 and loses a point of Toughness.
                                                                                """,
                                                                         "modifier": ModifierModel().generateModelFromDict(data:
                                                                        [
                                                                            "isPositive": false,
                                                                            "modInt": 1,
                                                                            "attribute": "",
                                                                            "skill": "Size, Toughness"
                                                                         ])
                                                                        ])
    
    var Stubborn: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Stubborn",
                                                                             "level": "Minor",
                                                                             "summary": """
                                                                                    Stubborn individuals always want their way and never admit they’re wrong. Even when it’s painfully obvious they’ve made a mistake  they try to justify it with half-truths and rationalizations.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Suspicious: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                                ["title": "Suspicious",
                                                                                 "level": "Major, Minor",
                                                                                 "summary": """
                                                                                        Your character is suspicious of everyone. As a Minor Hindrance, his paranoia causes frequent trust issues. He might demand full payment before doing a task, want every agreement in writing, or believe even his
                                                                                        friends are out to get him.
                                                                                        As a Major Hindrance, Support rolls to aid the distrustful individual are made at −2.
                                                                                        """,
                                                                                 "modifier": ModifierModel().generateModelFromDict(data:
                                                                                [
                                                                                    "isPositive": false,
                                                                                    "modInt": 2,
                                                                                    "attribute": "",
                                                                                    "skill": "Support"
                                                                                 ])
                                                                                ])
    
    var Thin_Skinned: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                                ["title": "Thin Skinned",
                                                                                 "level": "Major, Minor",
                                                                                 "summary": """
                                                                                        Personal attacks really get under this individual’s skin. As a Minor Hindrance, he subtracts 2 when resisting Taunt attacks. As a Major, he subtracts 4.
                                                                                        """,
                                                                                 "modifier": ModifierModel().generateModelFromDict(data:
                                                                                [
                                                                                    "isPositive": false,
                                                                                    "modInt": 4,
                                                                                    "attribute": "",
                                                                                    "skill": "Taunt"
                                                                                 ])
                                                                                ])
    
    var Tongue_Tied: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                                ["title": "Tongue-Tied",
                                                                                 "level": "Major",
                                                                                 "summary": """
                                                                                        Your adventurer flubs cool lines (or thinks of them afterwards!), goes off on tangents when he’s trying to talk someone into something, and generally miscommunicates most everything he says.
                                                                                        He suffers a −1 penalty to Intimidation, Performance, Persuasion, and Taunt rolls that involve speech.
                                                                                        """,
                                                                                 "modifier": ModifierModel().generateModelFromDict(data:
                                                                                [
                                                                                    "isPositive": false,
                                                                                    "modInt": 1,
                                                                                    "attribute": "",
                                                                                    "skill": "Intimidation, Performance, Persuasion, Taunt"
                                                                                 ])
                                                                                ])
    
    var Ugly: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                        ["title": "Ugly",
                                                                         "level": "Major, Minor",
                                                                         "summary": """
                                                                                Attractive people get all the breaks. This unfortunate individual isn’t one of them. He subtracts 1 from his Persuasion rolls, or 2 if taken as a Major Hindrance.
                                                                                """,
                                                                         "modifier": ModifierModel().generateModelFromDict(data:
                                                                        [
                                                                            "isPositive": false,
                                                                            "modInt": 2,
                                                                            "attribute": "",
                                                                            "skill": "Persuasion"
                                                                         ])
                                                                        ])
    
    var Vengeful: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Vengeful",
                                                                             "level": "Major, Minor",
                                                                             "summary": """
                                                                                    Payback is...well...bad news for someone, and this adventurer is going to get it.
                                                                                    As a Minor Hindrance she usually seeks vengeance legally. The method varies by situation. Some plot and scheme for months while others demand immediate results.
                                                                                    Those with the Major version of this Hindrance don’t let anything prevent them from a reckoning. This doesn’t mean they immediately resort to violence, but their actions always escalate until total and complete satisfaction is achieved.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Vow: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                        ["title": "Vow",
                                                                         "level": "Major, Minor",
                                                                         "summary": """
                                                                                The character has sworn an oath to someone or something he believes in.The danger in fulfilling the Vow and how often it might occur determines the level of the Hindrance. A Minor Vow might be to serve an order with a broad mandate that rarely conflicts with the party’s goals.
                                                                                A Major Vow makes long-term and frequent demands on the servant’s time and results in great risks to his life.
                                                                                """,
                                                                         "modifier": ModifierModel().generateModelFromDict(data:
                                                                        [
                                                                            "isPositive": false,
                                                                            "modInt": 0,
                                                                            "attribute": "",
                                                                            "skill": ""
                                                                         ])
                                                                        ])
    
    var Wanted: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Wanted",
                                                                             "level": "Major, Minor",
                                                                             "summary": """
                                                                                    Your hero has committed some crime and will be arrested if discovered by the authorities. This assumes the setting actually has laws and police officers to enforce them.
                                                                                    The level of the Hindrance depends on how serious the crime was and how active the hunters are. A hero with numerous unpaid parking tickets (in a game where he might have to drive occasionally) has a Minor Hindrance, as does someone wanted for more serious crimes away from the main campaign area. Being accused of murder is a Major Hindrance in almost any setting if there’s someone around to seek justice (or vengeance).
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 0,
                                                                                "attribute": "",
                                                                                "skill": ""
                                                                             ])
                                                                            ])
    
    var Yellow: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                            ["title": "Yellow",
                                                                             "level": "Major",
                                                                             "summary": """
                                                                                    Not everyone has ice water in their veins. Your hero is squeamish at the sight of blood and gore and terrified of coming to harm. He subtracts 2 from Fear checks and when resisting Intimidation.
                                                                                    """,
                                                                             "modifier": ModifierModel().generateModelFromDict(data:
                                                                            [
                                                                                "isPositive": false,
                                                                                "modInt": 2,
                                                                                "attribute": "",
                                                                                "skill": "Intimidation"
                                                                             ])
                                                                            ])
    
    var Young: HindranceModel = HindranceModel().generateModelFromDict(data:
                                                                        ["title": "Young",
                                                                         "level": "Major, Minor",
                                                                         "summary": """
                                                                                The hero is 12–15 years old (in human years — adjust this for other races). He has only 4 points to adjust his attributes instead of 5,and 10 skill points instead of 12. He may also have legal restrictions depending on the setting (can’t drive, own a firearm, and so on).
                                                                                On the plus side, youths have a fair amount of luck. They draw one extra Benny at the beginning of each game session (this stacks with other Edges such Luck or Great Luck).
                                                                                Most Young characters should also take the Small Hindrance, but it’s not mandatory.
                                                                                As a Major Hindrance, the character is Very Young (8 to 11 years old). He has only 3 points for attributes and 10 for skills, and the Small Hindrance. Very Young heroes draw two
                                                                                extra Bennies at the start of each session.
                                                                                """,
                                                                         "modifier": ModifierModel().generateModelFromDict(data:
                                                                        [
                                                                            "isPositive": false,
                                                                            "modInt": 2,
                                                                            "attribute": "",
                                                                            "skill": "Intimidation"
                                                                         ])
                                                                        ])
}


class EdgeCategory: NSObject {
    var generalDescription: String?
    var edges: [EdgeModel] = []
    
    convenience init(generalDescription: String, edges: [EdgeModel])  {
        self.init()
        
        self.generalDescription = generalDescription
        self.edges = edges
    }
}

class Edges: NSObject {
    
    var Background_Edges: EdgeCategory?
    var Combat_Edges: EdgeCategory?
    var Leadership_Edges: EdgeCategory?
    var Power_Edges: EdgeCategory?
    var Professional_Edges: EdgeCategory?
    var Social_Edges: EdgeCategory?
    var Weird_Edges: EdgeCategory?
    var Legendary_Edges: EdgeCategory?
    
    override init() {
        super.init()
        
        Background_Edges = EdgeCategory(generalDescription: """
            These Edges are typically advantages a character is born with, learns from prolonged and extensive training, or
            gains after exposure to certain events.
            Players can choose these Edges after character creation with a little rationalization. An individ- ual might choose the Attractive Edge, for example, by clean-
            ing herself up, getting a makeover, and generally paying more attention to her looks. Characters might be able to gain the
            Arcane Background Edge by finding a book of forbid- den knowledge or training with another arcane type in their party during down- time between adventures
            """, edges: [Alertness, Ambidextrous, Arcane_Background, Arcane_Resistance, Improved_Arcane_Resistance, Aristocrat, Attractive, Very_Attractive, Berserk, Brave, Brawny, Brute, Charismatic, Elan, Fame, Famous, Fast_Healer, Fleet_Footed, Linguist, Luck, Great_Luck, Quick, Rich, Filthy_Rich])
        
        Combat_Edges = EdgeCategory(generalDescription: "These Edges are designed to help your hero dish out terrible damage—or survive it—in the bloody battles of Savage Worlds.", edges: [Block, Improved_Block, Brawler, Bruiser, Calculating, Combat_Reflexes, Counterattack, Improved_Counterattack, Dead_Shot, Dodge, Improved_Dodge, Double_Tap, Extraction, Improved_Extraction, Feint, First_Strike, Improved_First_Strike, Free_Runner, Frenzy, Improved_Frenzy, Giant_Killer, Hard_to_Kill, Harder_to_Kill, Improvisational_Fighter, Iron_Jaw, Killer_Instinct, Level_Headed, Improved_Level_Headed, Marksman, Martial_Artist, Martial_Warrior, Mighty_Blow, Nerves_of_Steel, Improved_Nerves_of_Steel, No_Mercy, Rapid_Fire, Improved_Rapid_Fire, Rock_and_Roll, Steady_Hands, Sweep, Improved_Sweep, Trademark_Weapon, Improved_Trademark_Weapon, Two_Fisted, Two_Gun_Kid])
        
        Leadership_Edges = EdgeCategory(generalDescription: """
Leadership Edges grant bonuses to allies, making them more effective, reliable, or durable.
Unless an Edge says otherwise, it only affects allied Extras. Wild Cards only benefit if the leader has the Natural Leader Edge.
Leadership Edges aren’t cumulative with the same Edge from other leaders. Characters may benefit from different Leadership Edges by the same or different leaders, however.
Command Range: Allies must be within 5′′ (10 yards) to benefit from her abilities. This is called her “Command Range.”

""", edges: [Command, Command_Presence, Fervor, Hold_the_Line, Inspire, Tactician, Master_Tactician])
        
        
        Power_Edges = EdgeCategory(generalDescription: """
        Power Edges are the key to unlocking the true potential of those with Arcane Backgrounds (explained in Chapter Five). They can mean the difference between an apprentice with a few abilities and a master of magic, miracles, psionics, or weird science!
""", edges: [Artificer, Channeling, Concentration, Extra_Effort, Gadgeteer, Holy_UnHoly_Warrior, Mentalist, New_Powers, Power_Points, Power_Surge, Rapid_Recharge, Improved_Rapid_Recharge, Soul_Drain, Wizard])
        
        Professional_Edges = EdgeCategory(generalDescription: """
            Professional Edges reflect years of practice or experience in a particular trade, activity, or craft. In some cases they may also represent special blessings from higher powers as well.
            Players may purchase Professional Edges after character creation, perhaps roleplaying the achievement by practicing the affected trade during downtime or in between adventures.
            Stacking: Bonuses to the same Trait from different Professional Edges do not stack.
            Apply only the highest.
        """, edges: [Ace, Acrobat, Combat_Acrobat, Assassin, Investigator, Jack_of_all_Trades, McGyver, MR_Fix_It, Scholar, Soldier, Thief, Woodsman])
        
        Social_Edges = EdgeCategory(generalDescription: "Getting people to do what you want is a critical skill in most any setting.", edges: [Bolster, Common_Bond, Connections, Humiliate, Menacing, Provoke, Rabble_Rouser, Reliable, Retort, Streetwise, Strong_Willed, Iron_Will, Work_the_Room])
        
        Weird_Edges = EdgeCategory(generalDescription: "Weird Edges are slightly supernatural in origin and so are usually only appropriate in games with those elements. Check with your GM before taking them.", edges: [Beast_Bond, Beast_Master, Champion, Chi, Danger_Sense, Healer, Liquid_Courage, Scavanger])
        
        Legendary_Edges = EdgeCategory(generalDescription: "Most Legendary Edges are very specific to their campaign world—such as gaining a stronghold or divine favor—but a few fit most anywhere. Here are a few that should fit most every setting or genre, from the dungeons of swords & sorcery worlds to the far-flung worlds of futuristic space operas.", edges: [Followers, Professional, Expert, Master, Sidekick, Tough_as_Nails, Tougher_than_Nails, Weapons_Master, Master_of_Arms])
        
    }
    
    var Alertness: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Alertness",
        "summary": "Not much gets by this hero. He’s very observant and perceptive, and adds +2 to his Notice rolls to hear, see, or otherwise sense the world around him.",
        "requiredExperience": "novice",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Notice"
        ])
    ])
    
    var Ambidextrous: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Ambidextrous",
        "summary": """
            Your warrior is as deft with his left hand as
            he is with his right. He ignores the Off-Hand penalty (see page 104).
            If holding a weapon in each hand, Ambi- dextrous characters may stack Parry bonuses (if any) from both weapons.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Agility",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Arcane_Background: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Arcane Background",
        "summary": """
            Exposure to strange energies, studies at a magical school, or gifts from divine or spiritual entities sometimes grant champions their own powers and abilities. Such events lead to the Arcane Background Edge and the development of supernatural abilities. See Chapter Five for a complete description of Arcane Backgrounds, powers, and how to use them.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Arcane_Resistance: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Arcane Resistance",
        "summary": """
            Magic and the supernatural hold little sway with this individual. Whether by nature, heritage, or training he’s particularly resistant to magic, psionics, weird science, and other supernatural energies. Arcane skills targeting the hero suffer a −2 penalty (even if cast by allies!) and magical damage is reduced by 2 as well.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Spirit",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": false,
            "modInt": 2,
            "attribute": "",
            "skill": "Magical Damage, Arcane Skills"
        ])
    ])
    
    var Improved_Arcane_Resistance: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Arcane Resistance",
        "summary": """
            Magic and the supernatural hold little sway with this individual. Whether by nature, heritage, or training he’s particularly resistant to magic, psionics, weird science, and other supernatural energies. Arcane skills targeting the hero suffer a −4 penalty (even if cast by allies!) and magical damage is reduced by 4 as well.
            """,
        "requiredExperience": "novice, Arcane Resistance",
        "requiredSkillName": "Spirit",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": false,
            "modInt": 4,
            "attribute": "",
            "skill": "Magical Damage, Arcane Skills"
        ])
    ])
    
    var Aristocrat: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Aristocrat",
        "summary": """
            This individual was born into privilege or came into it later in life. She may or may not have money (the Rich or Filthy Rich Edge), but she still walks in the elite social circles of the setting.
            Aristocrats add +2 to Persuasion when Networking (see page 133) with the local elite, captains of industry, nobles, or other aristocrats. They also add +2 to Common Knowledge rolls made to know the etiquette of the upper class, recognize family trees or heraldry, or recall gossip concerning others of their station.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Persuasion*, Common Knowledge*"
        ])
    ])
    
    var Attractive: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Attractive",
        "summary": """
            It’s no secret people are more willing to help those they find physically attractive. Your character adds +1 to Performance and Persuasion rolls if the target is attracted to his general type (gender, sex, species, etc.).
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Persuasion, Performance"
        ])
    ])
    
    var Very_Attractive: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Very Attractive",
        "summary": """
            It’s no secret people are more willing to help those they find physically attractive. Your character adds +2 to Performance and Persuasion rolls if the target is attracted to his general type (gender, sex, species, etc.).
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Attractive",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Persuasion, Performance"
        ])
    ])
    
    var Berserk: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Beserk",
        "summary": """
            Berserkers become wild and nearly uncon-trollable when the “red rage” takes them, but they are deadly killing machines as well!
            Immediately after suffering a Wound or a Shaken result (from physical damage only), your hero must make a Smarts roll or go Berserk. She can voluntarily fail this check if she likes.
            Going Berserk has the following effects:
             FURY: The character’s Strength increases a die type and every melee attack must be a Wild Attack (see page 109). She cannot use any skills that require wit or concentration (GM’s call). She may scream out threats and use Intimidation, for example.
             ENRAGED: Adrenaline and rage fuel the berserker’s muscles, adding +2 to Toughness. She ignores one level of Wound penalties (this stacks with any other abilities that reduce Wound penalties).
             RECKLESS ABANDON: Anytime a berserker rolls a Critical Failure on a Fighting check, she hits a random target within range of her attack (not the intended target), friend or foe. If there are no applicable targets, the blow simply misses, smashes nearby objects, etc.
            After five consecutive rounds of berserk fury, the hero takes a level of Fatigue. At ten rounds, she takes another level of Fatigue and the rage ends. She may also choose to end her rage at any time by making a Smarts −2 roll (as a free action; possibly avoiding Fatigue if she manages to end her rage before it’s incurred!). Start the count anew if she goes berserk again, even in the same battle.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Toughness, Performance"
        ])
    ])
    
    var Brave: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Brave",
        "summary": """
            Those with this Edge have learned to master their fear, or have dealt with so many horrors they’ve become jaded. These valiant explorers add +2 to Fear checks and subtract 2 from Fear Table results (see page 124).
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Spirit",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Fear Checks"
        ])
    ])
    
    var Brawny: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Brawny",
        "summary": """
            Your bruiser is very large or very fit. Her Size increases by +1 (and therefore Toughness by 1) and she treats her Strength as one die type higher when determining Encumbrance (page 67) and Minimum Strength to use armor, weapons, and equipment without a penalty (page 66).
            Brawny can’t increase a character’s Size above +3.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Strength, Vigor",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Size"
        ])
    ])
    
    var Brute: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Brute",
        "summary": """
            Brutes focus on core strength and fitness over coordination and flexibility. They treat Athletics as linked to Strength instead of Agility for purposes of Advancement. The character may also resist Athletics Tests with Strength if she chooses.
            Finally, Brutes increase the Short Range of any thrown item by +1. Double that for the adjusted Medium Range, and double again for Long Range. If a thrown item’s Range is 3/6/12, for example, a Brute’s Range is 4/8/16.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Strength, Vigor",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Charismatic: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Charismatic",
        "summary": """
            Your hero is likable for some reason. She may be trustworthy or kind, or might just exude confidence and goodwill. You get one free reroll on Persuasion rolls.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Spirit",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": "Persuasion"
        ])
    ])
    
    var Elan: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Elan",
        "summary": """
            Elan means energy or spirit. Those who have it rise to the occasion when the going gets toughest. When you spend a Benny to reroll a Trait, add +2 to the total. The bonus applies only when rerolling. It doesn’t apply to damage rolls (since they’re not Trait rolls), nor does it apply to Soak rolls unless you’re using another Benny to reroll the Vigor check.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Spirit",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Trait Rolls*"
        ])
    ])
    
    var Fame: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Fame",
        "summary": """
            Your character is a minor celebrity of some sort. She might be a popular bard known in a particular fiefdom, a minor rock star, or a beloved B-movie actor.
            She makes double the normal fee when performing for pay (see Performance, page 32). She can also use her celebrity to add +1 to Persuasion rolls if a target is friendly and knows who she is (a Common Knowledge roll modified by how likely the individual is to know the celebrity).
            The downside of Fame is that the individual is often recognized, others frequently want something from her, she may be followed by fans or admirers, or she may not be able to shirk obligations, performances, or other duties without causing trouble for herself.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Persuasion"
        ])
    ])
    
    var Famous: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Famous",
        "summary": """
            Your hero is truly famous. She’s well-known in a large circle such as a country, a large industry, or a popular medium (film or television, the music industry). She makes 5× the normal fee when performing and adds +2 to Persuasion rolls when influencing friendly individuals who know who she is.
            The price is higher for the truly Famous, too, with more demands on her time, obligations, rivals, scandals, and an inability to operate in crowds without being recognized.
            """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Fame",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Persuasion"
        ])
    ])
    
    var Fast_Healer: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Fast Healer",
        "summary": """
            Those with this blessing add +2 to Vigor rolls for natural healing, and check every three days instead of five (see Healing, page 96)
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Vigor",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "Vigor",
            "skill": ""
        ])
    ])
    
    var Fleet_Footed: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Fleet Footed",
        "summary": """
            The hero’s Pace is increased by +2 and his running die increases one step (from d6 to d8, for example).
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Agility",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Pace"
        ])
    ])
    
    var Linguist: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Linguist",
        "summary": """
            This world-traveler has an ear for languages.
            She begins play knowing half her Smarts die type in different Language skills of her choice at d6 (see the Language skill on page 31)
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Smarts",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Luck: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Luck",
        "summary": """
            The adventurer seems to be blessed by fate, karma, the gods, or whatever external forces he believes in (or believe in him!).
            He draws one extra Benny at the beginning of each game session, allowing him to succeed at important tasks more often than most, and survive incredible dangers.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Bennies"
        ])
    ])
    
    var Great_Luck: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Great Luck",
        "summary": """
            The adventurer seems to be blessed by fate, karma, the gods, or whatever external forces he believes in (or believe in him!).
            He draws one extra Benny at the beginning of each game session, allowing him to succeed at important tasks more often than most, and survive incredible dangers.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Luck",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Bennies"
        ])
    ])
    
    var Quick: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Quick",
        "summary": """
            Quick characters have lightning-fast reflexes and a cool head. Whenever you are dealt an Action Card of Five or lower, you may discard it and draw again until you get a card higher than Five.
            Characters with both the Level Headed and Quick Edges first draw their additional card and choose which to take. If that card is a Five or less, the Quick Edge may be used to draw a replacement until it’s Six or higher.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Agility",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Rich: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Rich",
        "summary": """
            Whether the individual was born with a silver spoon in his mouth or earned it through hard work, he’s got more money than most.
            Rich heroes start with three times the normal starting funds for the setting. If a regular income is appropriate for this setting, the hero receives the modern-day equivalent of a $150,000 annual salary.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Filthy_Rich: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Filthy Rich",
        "summary": """
            This fortunate individual is very wealthy.
            He has five times the starting funds for the setting during character creation and, if appropriate, a yearly income after responsibilities of around $500,000.
            Even wealthier characters may exist, but unless there’s a game effect it probably shouldn’t matter. This should be worked out with the GM and come with many more assets as well as onerous responsibilities.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Rich",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Block: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Block",
        "summary": """
            Through hard-fought experience your hero has learned to defend himself in vicious hand-to-hand combat. His Parry increases by +1 and any Gang Up bonus against him is reduced by one.
            """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Fighting",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Parry"
        ])
    ])
    
    var Improved_Block: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Block",
        "summary": """
            The hero’s Parry bonus is now +2 and the Gang Up bonus against him is reduced by 2.
            """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Fighting",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Parry"
        ])
    ])
    
    var Brawler: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Brawler",
        "summary": """
            His fists hit like hammers or his talons cut like scythes. His body feels like it’s made of stone. Brawlers increase their Toughness by 1 and roll Strength +d4 when hitting with their fists or feet (or claws if they have them). If they already have a damage die from Claws (page 18), the Martial Artist Edge, etc., increase the damage die type by one instead.
            The Brawler Edge doesn’t make the character’s fists Natural Weapons (page 104).
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Strength, Vigor",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Toughness"
        ])
    ])
    
    var Bruiser: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Bruiser",
        "summary": """
            His fists hit like hammers or his talons cut like scythes. His body feels like it’s made of stone. Brawlers increase their Toughness by 1 and roll Strength +d4 when hitting with their fists or feet (or claws if they have them). If they already have a damage die from Claws (page 18), the Martial Artist Edge, etc., increase the damage die type by one instead.
            The Brawler Edge doesn’t make the character’s fists Natural Weapons (page 104).
            """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Brawler",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Toughness"
        ])
    ])
    
    var Calculating:EdgeModel = EdgeModel().generateModelFromDict(data: [
    "title": "Calculating",
    "summary": """
        A few seconds to study your foe’s actions gives your hero a major advantage. When his Action Card is a Five or less, he ignores up to 2 points of penalties on one action that turn, which can include Multi-Action, cover, Range, and even Wound penalties.
        """,
    "requiredExperience": "novice",
    "requiredSkillName": "Smarts",
    "requiredSkillLevel": "d8",
    "modifier": ModifierModel().generateModelFromDict(data: [
        "isPositive": true,
        "modInt": 0,
        "attribute": "",
        "skill": ""
    ])
])
    
    var Combat_Reflexes: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Combat Reflexes",
        "summary": """
            Your warrior recovers quickly from shock and trauma. He adds +2 to his rolls when attempting to recover from being Shaken or Stunned.
            """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Shaken Rolls, Stunned Rolls"
        ])
    ])
    
    var Counterattack: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Counterattack",
        "summary": """
            Fighters with this Edge deal instant punishment for an enemy’s mistakes. Once per round (if not Shaken or Stunned), the character receives a Free Attack (page 101) against one failed Fighting attack against him. The counterattack takes place immediately (before other hits against the hero on the same Action Card, if any).
            """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Fighting",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Improved_Counterattack: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Improved Counterattack",
        "summary": """
            As above but the hero gets a Free Attack against up to three failed attacks each round.
            """,
        "requiredExperience": "veteran",
        "requiredSkillName": "Counterattack",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Dead_Shot: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Dead Shot",
        "summary": """
            When your Action Card is a Joker, double the total damage of your first successful Athletics (throwing) or Shooting roll this round.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Atheletics or Shooting",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Dodge: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Dodge",
        "summary": """
            The hero can anticipate attacks or move erratically under fire. Unless the victim of a surprise attack and taken completely unaware, Dodge subtracts 2 from all ranged attacks made against the character. Dodge does not stack with actual cover, however.
            """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Agility",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Improved_Dodge: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Improved Dodge",
        "summary": """
            The hero adds +2 when Evading area effect attacks. See Evasion on page 100.
            """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Dodge",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Double_Tap: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Double Tap",
        "summary": """
            Experienced firearms experts fire two shots in rapid succession without spoiling their aim.
            Double Tap can only be used with weapons that have a Rate of Fire of 1 and can fire two shots without needing to manually reload. It adds +1 to hit and damage at the cost of one extra bullet. This is per action, so a shooter can Double Tap more than once if she performs a Multi-Action.
            Double Tap cannot be combined with Rapid Fire.
            If used with a weapon capable of Three- Round Burst (see page 67), it adds +2 to Shooting and damage instead of +1 and expends six bullets
            """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Shooting",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Extraction: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Extraction",
        "summary": """
            When a character withdraws from melee, adjacent attackers get a free Fighting attack against him (see Withdrawing from Melee on page 109). This is a very dangerous proposition for most, but not your wily champion.
            When moving away from adjacent foes, one of them (player’s choice), doesn’t get his free Fighting attack.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Agility",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Improved_Extraction: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Improved Extraction",
        "summary": """
            Up to three foes’ (player’s choice) don’t get attacks when your warrior moves out of melee with them.
            """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Extraction",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Feint: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Feint",
        "summary": """
            When performing a Test (page 108) with the Fighting skill, you can choose to make the foe resist with Smarts instead of Agility.
            """,
        "requiredExperience": "novice",
        "requiredSkillName": "Fighting",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var First_Strike:EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "First Strike",
        "summary": """
        Once per round, as long as he’s not Shaken or Stunned, the hero gets a free Fighting attack against a foe immediately after he moves into Reach. (See Free Attacks on page 101)
        """,
        "requiredExperience": "novice",
        "requiredSkillName": "Agility",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Improved_First_Strike:EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Improved First Strike",
        "summary": """
        As above but the hero may attack up to three foes each turn.
    """,
        "requiredExperience": "heroic",
        "requiredSkillName": "First Strike",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Free_Runner: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Free Runner",
        "summary": """
        Your character practices “parkour” or is just very skilled at running, jumping, swinging, scampering up walls, and over obstacles.
        As long as there are obstacles she can bound on, bounce off, or swing on, she moves at her full Pace on Difficult Ground when on foot. She also adds +2 to her Athletics rolls when climbing and in foot Chases (see Chases &
        Vehicles page 113).
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Agility, Athletics",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Athletics*"
        ])
    ])
    
    var Frenzy: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Frenzy",
        "summary": """
        A character with Frenzy rolls a second Fighting die with any one of his Fighting attacks for the turn. The extra die may be allocated to the same or different targets as he sees fit. Resolve each separately
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Fighting",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Fighting"
        ])
    ])
    
    var Improved_Frenzy: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Improved Frenzy",
        "summary": """
        The fighter rolls an extra Fighting die with up to two Fighting attacks in the same turn.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Fighting",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Fighting"
        ])
    ])
    
    var Giant_Killer: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Giant Killer",
        "summary": """
        The bigger they are, the harder they are to kill. At least for most. Your hero knows how to find the weak points in the most massive of foes.
        He adds +1d6 damage when attacking creatures who are three or more Sizes larger than himself (see Size, page 178). A human (Size 0) gets the bonus against a creature of Size 3 or greater.
    """,
        "requiredExperience": "veteran",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Hard_to_Kill: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Hard to Kill",
        "summary": """
        This adventurer has more lives than a herd of cats. He may ignore his Wound penalties when making Vigor rolls to avoid Bleeding Out (see page 95).
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Spirit",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Harder_to_Kill: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Harder to Kill",
        "summary": """
        Your hero is tougher to kill than Rasputin.
        If he is ever “killed,” roll a die. On an odd result, he’s dead as usual. On an even roll, he’s Incapacitated but somehow escapes death. He may be captured, stripped of all his belongings, or mistakenly left for dead, but he somehow survives.
    """,
        "requiredExperience": "veteran",
        "requiredSkillName": "Hard to Kill",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Improvisational_Fighter: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Improvisational Fighter",
        "summary": """
        Heroes often find themselves fighting with pieces of equipment or furnishings not designed for combat. A brawler with this Edge has a knack for using such improvised weapons. He ignores the usual −2 penalty when wielding them. See page 102 for details on Improvised Weapons.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Smarts",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Iron_Jaw: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Iron Jaw",
        "summary": """
        The hero can shrug off even extreme blows.
        He adds +2 to Soak rolls and Vigor rolls to avoid Knockout Blows (see page 100).
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Vigor",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Soak and Vigor Rolls*"
        ])
    ])
    
    var Killer_Instinct: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Killer Instinct",
        "summary": """
        This hero hates losing. He gets a free reroll in any opposed Test he initiates.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Level_Headed: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Level Headed",
        "summary": """
        Fighters who can keep their cool when every-one else is running for cover make deadly combatants. A hero with this Edge draws an additional Action Card in combat and chooses which to use.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Smarts",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Improved_Level_Headed:EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Level Headed",
        "summary": """
        As above but the hero draws two additional cards and chooses which to keep.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Level Headed",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Marksman: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Marksman",
        "summary": """
        The hero is a natural with ranged weapons. If she doesn’t move in a turn and fires no more than a Rate of Fire of 1 as her first action, she may add +1 to an Athletics (throwing) or Shooting roll, or ignore up to 2 points of penalties from Called Shots, Cover, Range, Scale, or Speed. This is a lesser version of the Aim maneuver and does not stack with it. Marksman doesn’t apply to additional attacks after the first.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Athletics or Shooting",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Athletics or Shooting"
        ])
    ])
    
    var Martial_Artist: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Martial Artist",
        "summary": """
        The fighter has trained in basic martial arts. Her fists and feet are weapons (see Natural Weapons, page 104) so she’s always consid- ered armed. She adds +1 when striking with them and causes Strength+d4 damage. If she already has a Strength damage die from the Claws racial ability (page 18) or the Brawler Edge, increase the damage a die type.
        Martial Artist does not add to damage from other Natural Weapons such as fangs or horns.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Fighting",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Unarmed Strike"
        ])
    ])
    
    var Martial_Warrior: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Martial Warrior",
        "summary": """
        Increase the warrior’s Fighting bonus to +2 and her damage die an additional step
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Martial Artist",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Unarmed Strike"
        ])
    ])
    
    var Mighty_Blow:EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Mighty Blow",
        "summary": """
        If your Action Card is a Joker, double the damage of your first successful Fighting attack this round.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Fighting",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Nerves_of_Steel:EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Nerves Of Steel",
        "summary": """
        Your hero has learned to fight on through the most intense pain. He may ignore 1 point of Wound penalties.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Vigor",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Improved_Nerves_of_Steel: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Improved Nerves Of Steel",
        "summary": """
        Your hero has learned to fight on through the most intense pain. He may ignore 2 point of Wound penalties.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Vigor",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var No_Mercy: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "No Mercy",
        "summary": """
        When this killer spends a Benny to reroll damage, he adds +2 to his final total.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Re-Roll*"
        ])
    ])
    
    var Rapid_Fire:EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Rapid Fire",
        "summary": """
        The shooter is practiced at taking quick and accurate shots. As long as she’s armed with a fast-firing ranged weapon of some sort (such as a revolver or semi-automatic) and has enough ammunition to do so, she may increase her weapon’s Rate of Fire by 1 for any one of her Shooting attacks that turn.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Shooting",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "ROF"
        ])
    ])
    
    var Improved_Rapid_Fire: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Improved Rapid Fire",
        "summary": """
        The shooter may now increase her weapon’s Rate of Fire by 1 twice in the same turn (via a Multi-Action).
    """,
        "requiredExperience": "veteran",
        "requiredSkillName": "Rapid Fire",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "ROF"
        ])
    ])
    
    var Rock_and_Roll: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Rock and Roll",
        "summary": """
        Experienced shooters learn to compensate for the recoil of fully automatic weapons. If a character with this Edge doesn’t move on his turn, he ignores the Recoil penalty when firing at a Rate of Fire of 2 or higher. (See Recoil, page 105.)
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Shooting",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": "ROF"
        ])
    ])
    
    var Steady_Hands: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Steady Hands",
        "summary": """
        Firing from the back of a horse or moving vehicle is tricky business, but your adventurer has figured it out. She ignores the Unstable Platform penalty (see page 109).
        This also helps when running, reducing the usual penalty from −2 to −1 (see Movement, page 92).
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Agility",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": "ROF"
        ])
    ])
    
    var Sweep: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Sweep",
        "summary": """
        Sweep allows a character to make a single Fighting attack and apply it against all targets in his Reach at a −2 penalty (friends and foes alike). Resolve damage separately for each enemy that’s hit.
        A fighter may only perform a Sweep once per turn. It may not be combined with Frenzy
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Strength, Fighting",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Improved_Sweep: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Improved Sweep",
        "summary": """
        As above but the whirlwind of death may ignore the −2 penalty.
    """,
        "requiredExperience": "veteran",
        "requiredSkillName": "Sweep",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": "ROF"
        ])
    ])
    
    var Trademark_Weapon: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Trademark Weapon",
        "summary": """
        The hero knows one unique weapon (Excalibur, Old Betsy, Sting) like the back of his hand. When using it, he adds +1 to his Athletics (throwing), Fighting, or Shooting rolls, and +1 to Parry when readied (even if it’s a ranged weapon).
        A fighter can take this Edge multiple times, applying it to a different weapon each time. If a Trademark Weapon is lost, he can replace it but the benefits don’t kick in for a few days (however long the GM feels is dramatically appropriate).
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Chosen Weapon",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Athletics, Fighting, Shooting, Parry"
        ])
    ])
    
    var Improved_Trademark_Weapon: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Improved Trademark Weapon",
        "summary": """
        As above but the bonuses when using the weapon increase to +2.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Trademark Weapon",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Athletics, Fighting, Shooting, Parry"
        ])
    ])
    
    var Two_Fisted: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Two Fisted",
        "summary": """
        If a character makes a Fighting attack with one action and another from a different hand in a later action, the second attack doesn’t inflict a Multi-Action penalty. The Off-Hand penalty still applies unless he’s Ambidextrous, however (page 104).
        If the character has Two-Gun Kid, the second action may also be a ranged attack.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Agility",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Two_Gun_Kid: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Two Gun Kid",
        "summary": """
        Two-Gun Kid works just like Two-Fisted, but with ranged weapons, allowing her to fire or throw a weapon in each hand as two different actions but without triggering a Multi-Action penalty.
        If the character has Two-Fisted, the second action may also be a melee attack.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Agility",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Command: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Command",
        "summary": """
        Command is the basic ability to give clear instructions and support to allies in the thick of battle. Extras in Command Range add +1 to their Spirit rolls when attempting to recover from being Shaken and Vigor when attempting to recover from being Stunned.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Smarts",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "Spirit",
            "skill": ""
        ])
    ])
    
    var Command_Presence: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Command Presence",
        "summary": """
        A booming voice, effective commands, natural charisma, or simple training results in a much more effective combat element. A hero with this Edge has a Command Range of 10′′ (20 yards).
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Command",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Fervor: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Fervor",
        "summary": """
        A simple phrase uttered by a great leader can sometimes have momentous results. A commander with this ability can inspire his troops to bloody fervor by yelling a motto, slogan, or other inspirational words.
        Extras in range add +1 to their Fighting damage rolls.
    """,
        "requiredExperience": "veteran",
        "requiredSkillName": "Command, Spirit",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Fighting"
        ])
    ])
    
    var Hold_the_Line: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Hold the Line",
        "summary": """
        Hold the Line strengthens the will of any Extras under the hero’s command, adding +1 to their Toughness.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Command, Smarts",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Toughness"
        ])
    ])
    
    var Inspire: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Inspire",
        "summary": """
        Exceptional leaders inspire those around them to great feats of valor and determination. Once per turn, the hero may roll his Battle skill to Support one type of Trait roll, and apply it to all allied Extras in Command Range. A leader could Support all Shooting attacks in range, for example, or all Spirit rolls to recover from being Shaken.
        Inspire is an action and requires some sort of communication with those it affects.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Command",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Natural_Leader: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Natural Leader",
        "summary": """
        This leader has proven herself time and time again, gaining the respect of all those who fight by her side.
        Any Leadership Edge that says it applies only to Extras now applies to Wild Cards as well.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Command, Spirit",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Tactician: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Tactician",
        "summary": """
        The commander has a natural grasp of small unit tactics and can take advantage of rapidly changing situations.
        A Tactician is dealt an extra Action Card each round of combat or a chase — kept separate from his own cards. At the start of the round, he may discard it or give it to any one allied Extra in Command Range. The player or GM controlling the receiving character can decide whether to accept and replace her current Action Card, or discard it.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Command, Smarts, Battle",
        "requiredSkillLevel": "d8, d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Master_Tactician: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Master Tactician",
        "summary": """
        The Tactician now gets a total of two extra
        Action Cards to distribute each round.
    """,
        "requiredExperience": "veteran",
        "requiredSkillName": "Tactician",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Artificer: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Artificer",
        "summary": """
        Those who tangle with supernatural forces sometimes find ways to imbue powers into items. They may turn an ordinary blade into a magic sword, grant powerful potions to their friends, or even bless holy relics with divine grace.
        Artificers can create Arcane Devices and give them to their allies. See page 153.
    """,
        "requiredExperience": "Seasoned",
        "requiredSkillName": "Arcane Background",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Channeling: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Channeling",
        "summary": """
        When the character gets a raise on her arcane skill roll (or roll to activate or use an arcane device), she reduces its Power Point cost by 1. This can take it to 0.
    """,
        "requiredExperience": "Seasoned",
        "requiredSkillName": "Arcane Background",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Concentration: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Concentration",
        "summary": """
        Through training and focus, the caster is extremely efficient in channeling arcane forces. The base Duration of any non-Instant power is doubled. This includes maintaining powers as well.
    """,
        "requiredExperience": "Seasoned",
        "requiredSkillName": "Arcane Background",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": "Duration"
        ])
    ])
    
    var Extra_Effort: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Extra Effort",
        "summary": """
        Some Gifted can dig deep into their souls to significantly boost their powers.
        Extra Effort increases a Focus total after it’s rolled by +1 for 1 Power Point, or +2 for 3 Power Points. It may not be used to improve a Critical Failure
    """,
        "requiredExperience": "Seasoned",
        "requiredSkillName": "Arcane Background(Gifted), Focus",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Focus"
        ])
    ])
    
    var Gadgeteer: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Gadgeteer",
        "summary": """
        Some mechanical gurus can build incredible devices out of most anything.
        A Gadgeteer can spend up to three Power Points to “jury rig” a device from any reasonable collection of spare parts. This allows her to activate any power normally available to Weird Scientists of her Rank or lower in her particular setting, with a Power Point cost of 3 or lower.
        The total cost of an individual power (plus any modifiers) cannot exceed the points spent to create it, nor can the inven- tor apply Limitations to the gadget. She may attempt to create multiple devices as long as she has the points to do so.
        Each gadget is created and activated with a Weird Science roll at –2. This takes one entire turn, during which she can do nothing else (she cannot take Multi-Actions that turn). In all other ways, it works as the normal activation of a power.
        The inventor uses Power Points directly from her pool for the device, but once its initial Duration is finished (it cannot be maintained) it falls apart into its component pieces.
    """,
        "requiredExperience": "Seasoned",
        "requiredSkillName": "Arcane Background(Weird Science), Weird Science",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Focus"
        ])
    ])
    
    var Holy_UnHoly_Warrior: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Holy/Unholy Warrior",
        "summary": """
        Believers face grave dangers in service to their divine patrons. To survive such hardships, the forces of good (or evil) grant miracles and the ability to turn their favor into supernatural protection.
        The chosen may add +1 to the total of a final Soak roll for each Power Point spent, to a maximum of +4.
    """,
        "requiredExperience": "Seasoned",
        "requiredSkillName": "Arcane Background(Miracles), Faith",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Soak Rolls"
        ])
    ])
    
    var Mentalist: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Mentalist",
        "summary": """
        Constant contact with multiple minds gives these psionic agents an edge when it comes to forcing or resisting mental assaults.
        Mentalists add +2 to opposed Psionics rolls, whether they are using their powers against a foe or defending against a rival.
    """,
        "requiredExperience": "Seasoned",
        "requiredSkillName": "Arcane Background(Psionics), Psionics",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Psionics"
        ])
    ])
    
    var New_Powers: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "New Powers",
        "summary": """
        An arcane character may learn two new powers by choosing this Edge (which may be taken multiple times). He may choose from any powers of his Rank or lower normally available to his particular Arcane Background.
        A character can add a new Trapping on a power she already has instead of gaining a new one. She might add an ice Trapping to her existing fire bolt, for example, so she could switch between ice and fire Trappings freely
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Arcane Background(Any)",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Power_Points: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Power Points",
        "summary": """
        Wizards, weird scientists, and other arcane types always want more power. This Edge grants them an additional 5 Power Points.
        Power Points may be selected more than once, but only once per Rank. It may be taken as often as desired at Legendary Rank, but each grants only 2 additional points.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Arcane Background(Any)",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 5,
            "attribute": "",
            "skill": "PP"
        ])
    ])
    
    var Power_Surge: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Power Surge",
        "summary": """
        The character recovers 10 Power Points when his Action Card is a Joker. This may not exceed his usual limit.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Arcane Background(Any)",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 10,
            "attribute": "",
            "skill": "PP"
        ])
    ])
    
    var Rapid_Recharge: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Rapid Recharge",
        "summary": """
        Power Points normally recharge at a rate of 5 points every hour spent resting (see Recharging, page 151). This Edge increases that rate to 10 every hour.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Arcane Background(Any), Spirit",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 10,
            "attribute": "",
            "skill": "PP"
        ])
    ])
    
    var Improved_Rapid_Recharge: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Improved Rapid Recharge",
        "summary": """
        The character now regains 20 Power Points per hour spent resting.
    """,
        "requiredExperience": "veteran",
        "requiredSkillName": "Rapid Recharge",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 20,
            "attribute": "",
            "skill": "PP"
        ])
    ])
    
    var Soul_Drain: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Soul Drain",
        "summary": """
        Desperate times call for desperate measures. Soul Drain allows an arcane character to channel her physical energy into power, taking a level of Fatigue to recover up to five Power Points. She can take an additional level of Fatigue (to Exhaustion) to recover up to five more Power Points. She cannot render herself Incapacitated in this way.
        Fatigue incurred by Soul Drain comes from deep within and may only be recovered naturally. The relief power and similar abilities have no effect.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Arcane Background(Any), Arcane Background",
        "requiredSkillLevel": "d10",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 5,
            "attribute": "",
            "skill": "PP"
        ])
    ])
    
    var Wizard: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Wizard",
        "summary": """
        Magic is varied and wonderful, and wizards are exposed to countless tomes, scrolls, and incantations as they master their craft. Sometimes they use this knowledge to recall variations of their various enchantments.
        A Wizard can spend 1 extra Power Point when casting a power to change its Trapping. A fireball (blast) might manifest as a lightning bolt, for example. This can often have important consequences if a foe has a particular resistance or weakness to the spell’s usual Trapping.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Arcane Background(Magic), Spellcasting",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": "PP"
        ])
    ])
    
    var Ace: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Ace",
        "summary": """
        Aces are pilots and drivers who have a special affinity with their car, boat, plane, or other vehicle. They ignore two points of penalties to any Boating, Driving, or Piloting roll, and may spend Bennies to Soak damage for any vehicle they control or command, using the appropriate Boating, Driving, or Piloting skill instead of Vigor. Each success and raise negates a Wound.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Agility",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Boating, Driving, Piloting"
        ])
    ])
    
    var Acrobat: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Acrobat",
        "summary": """
        The Acrobat gets one free reroll on Athletics totals that involve balance, tumbling, or grappling. It doesn’t affect rolls to interrupt actions, climb, swim, or throw.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Agility, Athletics",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Combat_Acrobat: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Combat Acrobat",
        "summary": """
        The tumbler leaps quickly about so that attacks against her are made at −1 as long as she’s aware of the attack, can reasonably move about, and isn’t suffering any Encumbrance or Minimum Strength penalties.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Acrobat",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Assassin: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Assassin",
        "summary": """
        Assassins are trained killers who know how to kill even the toughest foes. They add +2 to damage rolls when their foe is Vulnerable or they have The Drop.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Agility, Fighting, Stealth",
        "requiredSkillLevel": "d8, d6, d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Damage*"
        ])
    ])
    
    var Investigator: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Investigator",
        "summary": """
        Investigators spend a great deal of time researching ancient legends, working the streets, or deducing devilish mysteries. Some of these heroes are actual private investigators while others are sleuthing mages in a fantasy world or inquisitive college professors stumbling upon Things Man Was Not Meant to Know.
        Investigators add +2 to Research rolls and Notice rolls made to search through desks for important papers, sift through stacks of junk mail for something of note, or spy obscured items from piles of junk or debris.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Smarts, Research",
        "requiredSkillLevel": "d8, d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Research, Notice"
        ])
    ])
    
    var Jack_of_all_Trades: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Jack of all Trades",
        "summary": """
        Through advanced schooling, book-learning, computer-enhanced skill programs, or just amazing intuitive perception, your hero has a talent for picking up skills on the fly. There’s little he can’t figure out given a little time and a dash of luck.
        The character makes a Smarts roll as an action after observing or studying some subject. She gains a d4 in the relevant skill with success, or d6 with a raise. She may try again after an hour of study, trial and effort, or immersion if she fails or wants to try for a raise. This lasts until the character attempts to learn a different subject, whether she’s successful or not.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Smarts",
        "requiredSkillLevel": "d10",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var McGyver: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "McGyver",
        "summary": """
        A McGyver can improvise a device from common resources when the need arises. Given a few simple items, he can make a Repair roll to craft improvised weapons, explosives, or tools, that last until used or the end of the encounter (GM’s call). This takes one entire turn, and he can’t move or take any other actions while constructing the device.
        Failure means the device isn’t ready. A Critical Failure means he doesn’t have the right materials and can’t create the device this encounter.
        Success creates a minor explosive (2d4 explosive in a Small Blast Template), a one shot projectile weapon like a “zip gun” (Range 5/10/20, Damage 2d6), rickety raft, electrical source, etc.
        A raise creates a larger explosive (2d6 in a Medium Blast Template or 2d4 in a Large), a better ranged weapon (five shots, 2d8 damage, Range 10/20/40), a more stable raft, a more powerful battery, etc.
        The quality or power of the creation is completely up to the Game Master, but creativity should be rewarded, particularly in the most dire and dramatic situations.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Smarts, Notice, Repair",
        "requiredSkillLevel": "d6, d8, d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var MR_Fix_It: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Mr. Fix-it",
        "summary": """
        The mechanic adds +2 to Repair rolls. With a raise, he halves the time normally required to fix something. This means if a particular Repair job says a raise repairs it in half the time, a Mr. Fix It can finish the job in one- quarter the time with a raise.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Repair",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Repair"
        ])
    ])
    
    var Scholar: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Scholar",
        "summary": """
        Learned professors, devoted students, and amateur enthusiasts spend great amounts of time and energy studying particular subjects. They become experts in these fields, and rarely fail to answer questions in their particular area of expertise.
        Pick any one of the following skills: Academics, Battle, Occult, Science, or a Smarts-based “knowledge”-type skill allowed in your setting, and add +2 to the total whenever they’re used.
        This Edge may be taken more than once if applied to different skills.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Research",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Academics, Battle, Occult, Science, Smarts"
        ])
    ])
    
    var Soldier: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Soldier",
        "summary": """
        Professional soldiers get used to carrying heavy loads, and enduring harsh conditions. After a few days getting used to their gear (GM’s call), they treat their Strength as one die type higher when determining Encumbrance (page 67) and Minimum Strength to use armor, weapons, and equipment without a penalty (page 66). (This stacks with the Brawny Edge.)
        They also get a free reroll on Vigor rolls made to survive environmental hazards (see Hazards, page 125)
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Strength, Vigor",
        "requiredSkillLevel": "d6, d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Thief: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Thief",
        "summary": """
        Thieves specialize in deceit, treachery, and acrobatics. They can be invaluable where traps must be detected, walls must be climbed, and locks must be picked.
        Thieves know how to use protrusions on walls and window ledges to climb the tallest of buildings, scampering through streets and back alleys like cats. They add +1 to Athletics rolls made to climb in urban areas.
        Thieves also know how to use the dark areas between the streetlights of cities to conceal their movements, and add +1 to Stealth rolls when in an urban environment.
        Finally, these rogues are — not surprisingly — adept at Thievery itself, adding +1 to those rolls in all circumstances.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Agility, Stealth, Thievery",
        "requiredSkillLevel": "d8, d6, d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Athletics"
        ])
    ])
    
    var Woodsman: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Woodsman",
        "summary": """
        Woodsmen are rangers, scouts, and hunters who are more at home in the wilderness than in urban areas. They are skilled trackers and scouts, and know how to live off the land for months at a time.
        Woodsmen add +2 to Survival rolls, and Stealth rolls made in the wild (not towns, ruins, or underground)
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Spirit, Survival",
        "requiredSkillLevel": "d6, d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Survival"
        ])
    ])
    
    var Bolster: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Bolster",
        "summary": """
        Belittling or humiliating an enemy can also boost your ally’s spirits. When this character successfully Tests a foe, he may also remove the Distracted or Vulnerable state (page 100) from one of his allies.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Spirit",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Common_Bond: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Common Bond",
        "summary": """
        Selfless heroes and determined leaders know their greatest strength often comes from their companions, and are willing to give some of their own fortune, fate, or luck to support them.
        A character with this Edge may freely give her Bennies to any other character she can communicate with. The player should explain what form this takes, from a quick shout of encouragement to a welcome pat on the back
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Spirit",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Connections: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Connections",
        "summary": """
        Your heroine is connected to people or organizations who can help her when the chips are down. It might be the mob, the Feds, a union, or even other adventurers.
        Connections may be taken more than once, selecting a new faction or contact each time. Once per session, and assuming she can get in touch with them, the heroine can call on her friends for a favor.
        The favor depends on the nature of the contact (GM’s call), but might include a loan, gear, a few allied fighters, transportation, information, or even a professional with critical skills the party doesn’t have, like a hacker or scholar.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Humiliate: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Humiliate",
        "summary": """
        Those with a cruel wit can destroy a rival’s ego in a single remark or well-timed gesture. Your hero gets a free reroll on Taunt Tests.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Taunt",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Menacing: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Menacing",
        "summary": """
        Being a brutish lout isn’t always a drawback if you know how to use it. Menacing allows a character to put her bad looks or worse attitude to good use. The goon adds +2 to her Intimidation rolls.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Bloodthirsty, Mean, Ruthless, or Ugly",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Intimidation"
        ])
    ])
    
    var Provoke: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Provoke",
        "summary": """
        Clever characters can manipulate their foes,
        drawing enemy focus on themselves to protect their allies. Once per turn, when your hero uses Taunt for a Test and gets a raise (see Test, page 108), she may Provoke the foe.
        In addition to all the usual effects of the success and raise, the enemy suffers a −2 penalty to affect any other target besides the one who provoked her. This stacks with Distracted but not further instances of Provoke.
        Provoke lasts until a Joker is drawn, someone else Provokes the target, or the encounter ends. Provoke can affect multiple targets, and may be combined with Rabble Rouser (see below).
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Taunt",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Rabble_Rouser: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Rabble Rouser",
        "summary": """
        This instigator knows how to rile up several enemies at once.
        Once per turn, a character with this Edge can make a social Test with Intimidation or Taunt against all enemies in a Medium Blast Template. The targets must be able to see and hear the hero clearly. Each defender resists and is affected by the Test separately.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Spirit",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Reliable: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Reliable",
        "summary": """
        People know they can depend on your hero when they need assistance. He gets a free reroll on any Support roll.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Spirit",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Retort: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Retort",
        "summary": """
        This verbal duelist can turn the slings and arrows of social combat right back at the unwitting fools who hurled them.
        If a character with Retort gets a raise when resisting an Intimidation or Taunt Test, the foe is Distracted.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Taunt",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Streetwise: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Streetwise",
        "summary": """
        Streetwise characters know how to find the local black market, fence stolen goods, avoid the local law (or criminal element!), lay low when the heat’s on, obtain illegal weapons, find out which “boss” is hiring muscle, or similar shady activities.
        Streetwise characters add +2 to Intimidation or Persuasion rolls made to Network (see page 133) with shady or criminal elements. They also add +2 to Common Knowledge rolls pertaining to the types of disreputable activities listed above.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Smarts",
        "requiredSkillLevel": "d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Intimidation, Persuasion, Common Knowledge*"
        ])
    ])
    
    var Strong_Willed: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Strong Willed",
        "summary": """
        Self-confidence is powerful armor against those who attempt to attack this individual’s will. He adds +2 to his total when resisting Tests with Smarts or Spirit.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Spirit",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Resist"
        ])
    ])
    
    var Iron_Will: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Iron Will",
        "summary": """
        The hero now adds his Strong Willed bonus to resist powers and negate their effects. Iron Will doesn’t stack with Brave, nor does it apply to subse- quent rolls resulting from powers such as being Shaken by a damaging power, fear, or the like.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Brave, Strong Willed",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": "Resist"
        ])
    ])
    
    var Work_the_Room: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Work the Room",
        "summary": """
        Your hero’s words don’t just inspire those they’re directed at — they often inspire others as well. Once per turn, you can use Work the Room to roll an additional skill die when Supporting with Persuasion or Performance. The additional die Supports any other ally who can see or hear your hero, and applies to their next action, whatever it may be.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Spirit",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Work_the_Crowd: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Work the Crowd",
        "summary": """
        As Work the Room but the hero now can Support another on up to two of her Sup- port actions.
    """,
        "requiredExperience": "seasoned",
        "requiredSkillName": "Work the Room",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Beast_Bond: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Beast Bond",
        "summary": """
        Some individuals have an extraordinary bond with their animal companions. These characters may spend their own Bennies for any animals under their control, including mounts, pets, familiars, and so on.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Beast_Master: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Beast Master",
        "summary": """
        Animals take to your hero quickly and easily. They won’t attack him unless he attacks them first or they’re enraged for some reason.
        The Beast Master’s “animal magnetism” is so great he’s attracted a loyal animal of some sort as well. This is typically an animal of Size 0 or smaller, subject to the GM’s approval.
        The beast is an Extra and doesn’t Advance in Rank or abilities. If a pet is dismissed or killed, the hero gains a replacement in 1d4 days.
        More Powerful Companions: Beast Master may be taken more than once. Choose one of the effects below each time it’s chosen:
            • Gain an additional pet.
            • Increase one of the pet’s Traits one die type (only one Trait per pet).
            • Increase the maximum Size pet you may have by +1, to a maximum of 3.
            • Make one pet a Wild Card. (The hero must be of Heroic Rank)
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Spirit",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Champion: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Champion",
        "summary": """
            Champions are holy (or unholy) men and women chosen to fight for a particular deity or religion. Most are pious souls ready and willing to lay down their lives for a greater cause, but some may have been born into the role and follow their path with some reluctance.
            Champions fight the forces of darkness (or good), adding +2 damage when attacking supernaturally evil (or good if they’re evil) creatures. The bonus applies to area effect damage, ranged attacks, powers, etc.
            The GM must decide which foes this bonus applies to, but generally it’s any evil (or good!) creature born of magic or with any supernatural abilities.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Spirit, Fighting",
        "requiredSkillLevel": "d8, d6",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Damage*"
        ])
    ])
    
    var Chi: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Chi",
        "summary": """
            Your hero’s martial arts training goes beyond the norm and into the realm of the mystical. At the start of each combat encounter, she gains a “Chi Point” that can be spent to:
            • Reroll one of her failed attacks (even a Critical Failure).
            • Make an enemy discard an attack against her, then reroll it from scratch.
            • Add +d6 damage to a successful Fighting attack made with her hands, feet, claws, or other Natural Weapons (this may Ace).
            Unspent Chi is lost at the end of the combat encounter.
    """,
        "requiredExperience": "veteran",
        "requiredSkillName": "Martial Warrior",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Damage*"
        ])
    ])
    
    var Danger_Sense: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Danger Sense",
        "summary": """
            Your hero can sense when something bad is about to happen. When rolling for Surprise (page 108), he adds +2 to his Notice roll to act in the first round. With a raise, he starts the encounter on Hold.
            In other situations not covered by the Surprise rules (a sniper shot, pit trap, poisoned drink, etc.), Danger Sense gives him a Notice roll at −2 (or +2 if a Notice roll is usually allowed) to detect the hazard and take appropriate action. If this was an attack and the hero makes his Notice roll, the foe doesn’t get The Drop against him.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Notice"
        ])
    ])
    
    var Healer: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Healer",
        "summary": """
            A hero with this Edge adds +2 to all Healing rolls, whether natural or magical in nature.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Spirit",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 2,
            "attribute": "",
            "skill": "Healing"
        ])
    ])
    
    var Liquid_Courage: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Liquid Courage",
        "summary": """
            This gregarious individual processes alcohol far differently than most. The round after consuming a stiff drink (about eight ounces of hard liquor or equivalent), her Vigor increases one die type (increasing Toughness as well). The drinker can also ignore one level of Wound penalties (which stacks with other abilities that do the same).
            Smarts, Agility, and all linked skills suffer a −1 penalty for the duration, however.
            The effect lasts for one hour after it begins, at which point the boozer suffers a level of Fatigue for the next four hours.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Vigor",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": "Wound"
        ])
    ])
    
    var Scavanger: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Scavanger",
        "summary": """
            Once per encounter the hero may find, “suddenly remember,” or dig up some much- needed piece of equipment, a handful of ammunition, or some other useful device.
            The Game Master decides what constitutes an encounter, and has the final word on what can and can’t be found.
    """,
        "requiredExperience": "novice",
        "requiredSkillName": "Luck",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Followers: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Followers",
        "summary": """
            Each time this Edge is chosen, five followers come to fight by the hero’s side. If any are lost, others eventually take their place (how long is up to the GM and the circumstances).
            Followers must be cared for and generally want a share of whatever loot, treasure, or other rewards the hero acquires. Otherwise, they are completely dedicated to their task. They won’t throw their lives away but are willing to risk them repeatedly in his service.
            Use the Soldier profile found on page 188 for the followers. A hero may outfit her allies as she sees fit. Followers Advance just like player characters (see page 54).
            Use the Allies rules on page 111 to give them distinctive personalities if desired.
    """,
        "requiredExperience": "legendary",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Professional: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Professional",
        "summary": """
            The character is an expert at a particular skill or attribute (his choice). This increases the Trait and its limit one step (a d12 + 1 becomes a d12 + 2 , for example). This Edge may be selected once per Trait.
    """,
        "requiredExperience": "legendary",
        "requiredSkillName": "",
        "requiredSkillLevel": "maximum die type possible in affected Trait",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Expert: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Expert",
        "summary": """
            As the Professional Edge, increasing the Trait and its limit one additional step.
    """,
        "requiredExperience": "legendary",
        "requiredSkillName": "",
        "requiredSkillLevel": "professional in affected Trait",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Master: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Master",
        "summary": """
            The character’s Wild Die increases to a d10 when rolling the selected Expert Trait.
    """,
        "requiredExperience": "legendary",
        "requiredSkillName": "",
        "requiredSkillLevel": "Expert in affected Trait",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Sidekick: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Sidekick",
        "summary": """
            A character who triumphs over evil time and
            time again becomes an inspiration to others. Eventually, one of these young crusaders may attempt to join the hero in his epic quests.
            The hero gains a Novice Rank sidekick. The sidekick is a Wild Card, starts each session with two Bennies, may Advance, and has abilities that complement his mentor. The player character controls his sidekick just like any other ally, though he may occasionally cause trouble by getting captured, running into danger when he’s not supposed to, and so on. The player should be prepared for his Edge to occasionally become a Hindrance!
            If the sidekick dies, he isn’t replaced unless the hero chooses this Edge again. Fortunately, heroes may always spend Bennies for their sidekicks as if she had the Common Bond Edge. Sidekicks must actually take that Edge to do the same for their mentors.
    """,
        "requiredExperience": "legendary",
        "requiredSkillName": "",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Tough_as_Nails: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Tough as Nails",
        "summary": """
            Your character keeps going when others fall. She can take four Wounds before she’s Incapacitated (her maximum Wound penalty is still −3).
    """,
        "requiredExperience": "legendary",
        "requiredSkillName": "Vigor",
        "requiredSkillLevel": "d8",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Tougher_than_Nails: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Tougher than Nails",
        "summary": """
            Your character keeps going when others fall. She can take four Wounds before she’s Incapacitated (her maximum Wound penalty is still −3).
    """,
        "requiredExperience": "legendary",
        "requiredSkillName": "Vigor, Tough as Nails",
        "requiredSkillLevel": "d12",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 0,
            "attribute": "",
            "skill": ""
        ])
    ])
    
    var Weapons_Master: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Weapons Master",
        "summary": """
            The warrior increases his Parry by +1 and the bonus damage die for Fighting rolls is a d8 instead of a d6 (see Bonus Damage, page 94). He must be armed to gain these benefits, but this includes the Martial Artist Edge, claws, or other abilities that count as weapons.
    """,
        "requiredExperience": "legendary",
        "requiredSkillName": "Fighting",
        "requiredSkillLevel": "d12",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Parry"
        ])
    ])
    
    var Master_of_Arms: EdgeModel = EdgeModel().generateModelFromDict(data: [
        "title": "Master of Arms",
        "summary": """
            Increase the hero’s Parry an additional +1 and his Fighting bonus damage die is now a d10.
    """,
        "requiredExperience": "legendary",
        "requiredSkillName": "Weapons Master",
        "requiredSkillLevel": "",
        "modifier": ModifierModel().generateModelFromDict(data: [
            "isPositive": true,
            "modInt": 1,
            "attribute": "",
            "skill": "Parry"
        ])
    ])
    
    
    
    
    
}





