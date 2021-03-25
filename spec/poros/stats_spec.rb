require 'rails_helper'

describe Stats do
  before :each do
    @data = [{:name=>"Dwarf",
      :slug=>"dwarf",
      :desc=>"## Dwarf Traits\nYour dwarf character has an assortment of inborn abilities, part and parcel of dwarven nature.",
      :asi_desc=>"**_Ability Score Increase._** Your Constitution score increases by 2.",
      :asi=>[{:attributes=>["Constitution"], :value=>2}],
      :age=>"**_Age._** Dwarves mature at the same rate as humans, but they're considered young until they reach the age of 50. On average, they live about 350 years.",
      :alignment=>"**_Alignment._** Most dwarves are lawful, believing firmly in the benefits of a well-ordered society. They tend toward good as well, with a strong sense of fair play and a belief that everyone deserves to share in the benefits of a just order.",
      :size=>"**_Size._** Dwarves stand between 4 and 5 feet tall and average about 150 pounds. Your size is Medium.",
      :speed=>{:walk=>25},
      :speed_desc=>"**_Speed._** Your base walking speed is 25 feet. Your speed is not reduced by wearing heavy armor.",
      :languages=>"**_Languages._** You can speak, read, and write Common and Dwarvish. Dwarvish is full of hard consonants and guttural sounds, and those characteristics spill over into whatever other language a dwarf might speak.",
      :vision=>"**_Darkvision._** Accustomed to life underground, you have superior vision in dark and dim conditions. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can't discern color in darkness, only shades of gray.",
      :traits=>"**_Dwarven Resilience._** You have advantage on saving throws against poison, and you have resistance against poison damage.\n\n**_Dwarven Combat Training._** You have proficiency with the battleaxe, handaxe, light hammer, and warhammer.\n\n**_Tool Proficiency._** You gain proficiency with the artisan's tools of your choice: smith's tools, brewer's supplies, or mason's tools.\n\n**_Stonecunning._** Whenever you make an Intelligence (History) check related to the origin of stonework, you are considered proficient in the History skill and add double your proficiency bonus to the check, instead of your normal proficiency bonus.",
      :subraces=>[{:name=>"Hill Dwarf", :slug=>"hill-dwarf", :desc=>"As a hill dwarf, you have keen senses, deep intuition, and remarkable resilience.", :asi=>[{:attributes=>["Wisdom"], :value=>1}], :traits=>"**_Dwarven Toughness._** Your hit point maximum increases by 1, and it increases by 1 every time you gain a level.", :asi_desc=>"**_Ability Score Increase._** Your Wisdom score increases by 1", :document__slug=>"wotc-srd", :document__title=>"Systems Reference Document"}],
      :document__slug=>"wotc-srd",
      :document__title=>"Systems Reference Document",
      :document__license_url=>"http://open5e.com/legal"}, Background.new({background:"Acolyte", skill_proficiency_one:"Insight (WIS)", skill_proficiency_two:"Religion (INT)", tool_proficiency_one:"-", tool_proficiency_two:"-", extra_languages:"Any 2", equipment:'A musical instrument (one of your choice) - the favor of an admirer (love letter - lock of hair - or trinket) - a costume - and a pouch containing 15 gp', personality: "I feel tremendous empathy for all who suffer.", ideal: "Greater Good. My gifts are meant to be shared with all, not used for my own benefit. (Good)", bond: "I entered seclusion because I loved someone I could not have.", flaw: "I like keeping secrets and won’t share them with anyone."}), {:name=>"Fighter",
       :slug=>"fighter",
       :desc=>
        "### Fighting Style \n \nYou adopt a particular style of fighting as your specialty. Choose one of the following options. You can't take a Fighting Style option more than once, even if you later get to choose again. \n \n#### Archery \n \nYou gain a +2 bonus to attack rolls you make with ranged weapons. \n \n#### Defense \n \nWhile you are wearing armor, you gain a +1 bonus to AC. \n \n#### Dueling \n \nWhen you are wielding a melee weapon in one hand and no other weapons, you gain a +2 bonus to damage rolls with that weapon. \n \n#### Great Weapon Fighting \n \nWhen you roll a 1 or 2 on a damage die for an attack you make with a melee weapon that you are wielding with two hands, you can reroll the die and must use the new roll, even if the new roll is a 1 or a 2. The weapon must have the two-handed or versatile property for you to gain this benefit. \n \n#### Protection \n \nWhen a creature you can see attacks a target other than you that is within 5 feet of you, you can use your reaction to impose disadvantage on the attack roll. You must be wielding a shield. \n \n#### Two-Weapon Fighting \n \nWhen you engage in two-weapon fighting, you can add your ability modifier to the damage of the second attack. \n \n### Second Wind \n \nYou have a limited well of stamina that you can draw on to protect yourself from harm. On your turn, you can use a bonus action to regain hit points equal to 1d10 + your fighter level. Once you use this feature, you must finish a short or long rest before you can use it again. \n \n### Action Surge \n \nStarting at 2nd level, you can push yourself beyond your normal limits for a moment. On your turn, you can take one additional action on top of your regular action and a possible bonus action. \n \nOnce you use this feature, you must finish a short or long rest before you can use it again. Starting at 17th level, you can use it twice before a rest, but only once on the same turn. \n \n### Martial Archetype \n \nAt 3rd level, you choose an archetype that you strive to emulate in your combat styles and techniques. Choose Champion, Battle Master, or Eldritch Knight, all detailed at the end of the class description. The archetype you choose grants you features at 3rd level and again at 7th, 10th, 15th, and 18th level. \n \n### Ability Score Improvement \n \nWhen you reach 4th level, and again at 6th, 8th, 12th, 14th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can't increase an ability score above 20 using this feature. \n \n### Extra Attack \n \nBeginning at 5th level, you can attack twice, instead of once, whenever you take the Attack action on your turn. \n \nThe number of attacks increases to three when you reach 11th level in this class and to four when you reach 20th level in this class. \n \n### Indomitable \n \nBeginning at 9th level, you can reroll a saving throw that you fail. If you do so, you must use the new roll, and you can't use this feature again until you finish a long rest. \n \nYou can use this feature twice between long rests starting at 13th level and three times between long rests starting at 17th level.\n \n### Martial Archetypes \n \nDifferent fighters choose different approaches to perfecting their fighting prowess. The martial archetype you choose to emulate reflects your approach.",
       :hit_dice=>"1d10",
       :hp_at_1st_level=>"10 + your Constitution modifier",
       :hp_at_higher_levels=>"1d10 (or 6) + your Constitution modifier per fighter level after 1st",
       :prof_armor=>"All armor, shields",
       :prof_weapons=>"Simple weapons, martial weapons",
       :prof_tools=>"None",
       :prof_saving_throws=>"Strength, Constitution",
       :prof_skills=>"Choose two skills from Acrobatics, Animal, Handling, Athletics, History, Insight, Intimidation, Perception, and Survival",
       :equipment=>"You start with the following equipment, in addition to the equipment granted by your background: \n \n* (*a*) chain mail or (*b*) leather armor, longbow, and 20 arrows \n* (*a*) a martial weapon and a shield or (*b*) two martial weapons \n* (*a*) a light crossbow and 20 bolts or (*b*) two handaxes \n* (*a*) a dungeoneer's pack or (*b*) an explorer's pack",
       :table=>"| Level | Proficiency Bonus | Features                                          | \n|-------|-------------------|---------------------------------------------------| \n| 1st   | +2                | Fighting Style, Second Wind                       | \n| 2nd   | +2                | Action Surge (one use)                            | \n| 3rd   | +2                | Martial Archetype                                 | \n| 4th   | +2                | Ability Score Improvement                         | \n| 5th   | +3                | Extra Attack                                      | \n| 6th   | +3                | Ability Score Improvement                         | \n| 7th   | +3                | Martial Archetype Feature                         | \n| 8th   | +3                | Ability Score Improvement                         | \n| 9th   | +4                | Indomitable (one use)                             | \n| 10th  | +4                | Martial Archetype Feature                         | \n| 11th  | +4                | Extra Attack (2)                                  | \n| 12th  | +4                | Ability Score Improvement                         | \n| 13th  | +5                | Indomitable (two uses)                            | \n| 14th  | +5                | Ability Score Improvement                         | \n| 15th  | +5                | Martial Archetype Feature                         | \n| 16th  | +5                | Ability Score Improvement                         | \n| 17th  | +6                | Action Surge (two uses), Indomitable (three uses) | \n| 18th  | +6                | Martial Archetype Feature                         | \n| 19th  | +6                | Ability Score Improvement                         | \n| 20th  | +6                | Extra Attack (3)                                  | ",
       :spellcasting_ability=>"",
       :subtypes_name=>"Martial Archetypes",
       :archetypes=>[{:name=>"Champion", :slug=>"champion", :desc=>"The archetypal Champion focuses on the development of raw physical power honed to deadly perfection. Those who model themselves on this archetype combine rigorous training with physical excellence to deal devastating blows. \n \n##### Improved Critical \n \nBeginning when you choose this archetype at 3rd level, your weapon attacks score a critical hit on a roll of 19 or 20. \n \n##### Remarkable Athlete \n \nStarting at 7th level, you can add half your proficiency bonus (round up) to any Strength, Dexterity, or Constitution check you make that doesn't already use your proficiency bonus. \n \nIn addition, when you make a running long jump, the distance you can cover increases by a number of feet equal to your Strength modifier. \n \n##### Additional Fighting Style \n \nAt 10th level, you can choose a second option from the Fighting Style class feature. \n \n##### Superior Critical \n \nStarting at 15th level, your weapon attacks score a critical hit on a roll of 18-20. \n \n##### Survivor \n \nAt 18th level, you attain the pinnacle of resilience in battle. At the start of each of your turns, you regain hit points equal to 5 + your Constitution modifier if you have no more than half of your hit points left. You don't gain this benefit if you have 0 hit points.", :document__slug=>"wotc-srd", :document__title=>"Systems Reference Document", :document__license_url=>"http://open5e.com/legal"}],
       :document__slug=>"wotc-srd",
       :document__title=>"Systems Reference Document",
       :document__license_url=>"http://open5e.com/legal"}]
    @monk = {:name=>"Monk",
     :slug=>"monk",
     :desc=>
      "### Unarmored Defense \n \nBeginning at 1st level, while you are wearing no armor and not wielding a shield, your AC equals 10 + your Dexterity modifier + your Wisdom modifier. \n \n### Martial Arts \n \nAt 1st level, your practice of martial arts gives you mastery of combat styles that use unarmed strikes and monk weapons, which are shortswords and any simple melee weapons that don't have the two- handed or heavy property. \n \nYou gain the following benefits while you are unarmed or wielding only monk weapons and you aren't wearing armor or wielding a shield: \n \n* You can use Dexterity instead of Strength for the attack and damage rolls of your unarmed strikes and monk weapons. \n* You can roll a d4 in place of the normal damage of your unarmed strike or monk weapon. This die changes as you gain monk levels, as shown in the Martial Arts column of the Monk table. \n* When you use the Attack action with an unarmed strike or a monk weapon on your turn, you can make one unarmed strike as a bonus action. For example, if you take the Attack action and attack with a quarterstaff, you can also make an unarmed strike as a bonus action, assuming you haven't already taken a bonus action this turn. \n \nCertain monasteries use specialized forms of the monk weapons. For example, you might use a club that is two lengths of wood connected by a short chain (called a nunchaku) or a sickle with a shorter, straighter blade (called a kama). Whatever name you use for a monk weapon, you can use the game statistics provided for the weapon. \n \n### Ki \n \nStarting at 2nd level, your training allows you to harness the mystic energy of ki. Your access to this energy is represented by a number of ki points. Your monk level determines the number of points you have, as shown in the Ki Points column of the Monk table. \n \nYou can spend these points to fuel various ki features. You start knowing three such features: Flurry of Blows, Patient Defense, and Step of the Wind. You learn more ki features as you gain levels in this class. \n \nWhen you spend a ki point, it is unavailable until you finish a short or long rest, at the end of which you draw all of your expended ki back into yourself. You must spend at least 30 minutes of the rest meditating to regain your ki points. \n \nSome of your ki features require your target to make a saving throw to resist the feature's effects. The saving throw DC is calculated as follows: \n \n**Ki save DC** = 8 + your proficiency bonus + your Wisdom modifier \n \n#### Flurry of Blows \n \nImmediately after you take the Attack action on your turn, you can spend 1 ki point to make two unarmed strikes as a bonus action. \n \n#### Patient Defense \n \nYou can spend 1 ki point to take the Dodge action as a bonus action on your turn. \n \n#### Step of the Wind \n \nYou can spend 1 ki point to take the Disengage or Dash action as a bonus action on your turn, and your jump distance is doubled for the turn. \n \n### Unarmored Movement \n \nStarting at 2nd level, your speed increases by 10 feet while you are not wearing armor or wielding a shield. This bonus increases when you reach certain monk levels, as shown in the Monk table. \n \nAt 9th level, you gain the ability to move along vertical surfaces and across liquids on your turn without falling during the move. \n \n### Monastic Tradition \n \nWhen you reach 3rd level, you commit yourself to a monastic tradition: the Way of the Open Hand, the Way of Shadow, or the Way of the Four Elements, all detailed at the end of the class description. Your tradition grants you features at 3rd level and again at 6th, 11th, and 17th level. \n \n### Deflect Missiles \n \nStarting at 3rd level, you can use your reaction to deflect or catch the missile when you are hit by a ranged weapon attack. When you do so, the damage you take from the attack is reduced by 1d10 + your Dexterity modifier + your monk level. \n \nIf you reduce the damage to 0, you can catch the missile if it is small enough for you to hold in one hand and you have at least one hand free. If you catch a missile in this way, you can spend 1 ki point to make a ranged attack with the weapon or piece of ammunition you just caught, as part of the same reaction. You make this attack with proficiency, regardless of your weapon proficiencies, and the missile counts as a monk weapon for the attack, which has a normal range of 20 feet and a long range of 60 feet. \n \n### Ability Score Improvement \n \nWhen you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can't increase an ability score above 20 using this feature. \n \n### Slow Fall \n \nBeginning at 4th level, you can use your reaction when you fall to reduce any falling damage you take by an amount equal to five times your monk level. \n \n### Extra Attack \n \nBeginning at 5th level, you can attack twice, instead of once, whenever you take the Attack action on your turn. \n \n### Stunning Strike \n \nStarting at 5th level, you can interfere with the flow of ki in an opponent's body. When you hit another creature with a melee weapon attack, you can spend 1 ki point to attempt a stunning strike. The target must succeed on a Constitution saving throw or be stunned until the end of your next turn. \n \n### Ki-Empowered Strikes \n \nStarting at 6th level, your unarmed strikes count as magical for the purpose of overcoming resistance and immunity to nonmagical attacks and damage. \n \n### Evasion \n \nAt 7th level, your instinctive agility lets you dodge out of the way of certain area effects, such as a blue dragon's lightning breath or a *fireball* spell. When you are subjected to an effect that allows you to make a Dexterity saving throw to take only half damage, you instead take no damage if you succeed on the saving throw, and only half damage if you fail. \n \n### Stillness of Mind \n \nStarting at 7th level, you can use your action to end one effect on yourself that is causing you to be charmed or frightened. \n \n### Purity of Body \n \nAt 10th level, your mastery of the ki flowing through you makes you immune to disease and poison. \n \n### Tongue of the Sun and Moon \n \nStarting at 13th level, you learn to touch the ki of other minds so that you understand all spoken languages. Moreover, any creature that can understand a language can understand what you say. \n \n### Diamond Soul \n \nBeginning at 14th level, your mastery of ki grants you proficiency in all saving throws. \n \nAdditionally, whenever you make a saving throw and fail, you can spend 1 ki point to reroll it and take the second result. \n \n### Timeless Body \n \nAt 15th level, your ki sustains you so that you suffer none of the frailty of old age, and you can't be aged magically. You can still die of old age, however. In addition, you no longer need food or water. \n \n### Empty Body \n \nBeginning at 18th level, you can use your action to spend 4 ki points to become invisible for 1 minute. During that time, you also have resistance to all damage but force damage. \n \nAdditionally, you can spend 8 ki points to cast the *astral projection* spell, without needing material components. When you do so, you can't take any other creatures with you. \n \n### Perfect Self \n \nAt 20th level, when you roll for initiative and have no ki points remaining, you regain 4 ki points. \n \n### Monastic Traditions \n \nThree traditions of monastic pursuit are common in the monasteries scattered across the multiverse. Most monasteries practice one tradition exclusively, but a few honor the three traditions and instruct each monk according to his or her aptitude and interest. All three traditions rely on the same basic techniques, diverging as the student grows more adept. Thus, a monk need choose a tradition only upon reaching 3rd level.",
     :hit_dice=>"1d8",
     :hp_at_1st_level=>"8 + your Constitution modifier",
     :hp_at_higher_levels=>"1d8 (or 5) + your Constitution modifier per monk level after 1st",
     :prof_armor=>"None",
     :prof_weapons=>"Simple weapons, shortswords",
     :prof_tools=>"Choose one type of artisan's tools or one musical instrument",
     :prof_saving_throws=>"Strength, Dexterity",
     :prof_skills=>"Choose two from Acrobatics, Athletics, History, Insight, Religion, and Stealth",
     :equipment=>"You start with the following equipment, in addition to the equipment granted by your background: \n \n* (*a*) a shortsword or (*b*) any simple weapon \n* (*a*) a dungeoneer's pack or (*b*) an explorer's pack \n* 10 darts",
     :table=>
      "| Level | Proficiency Bonus | Martial Arts | Ki Points | Unarmored Movement | Features                                         | \n|-------|-------------------|--------------|-----------|--------------------|--------------------------------------------------| \n| 1st   | +2                | 1d4          | -         | -                  | Unarmored Defense, Martial Arts                  | \n| 2nd   | +2                | 1d4          | 2         | +10 ft.            | Ki, Unarmored Movement                           | \n| 3rd   | +2                | 1d4          | 3         | +10 ft.            | Monastic Tradition, Deflect Missiles             | \n| 4th   | +2                | 1d4          | 4         | +10 ft.            | Ability Score Improvement, Slow Fall             | \n| 5th   | +3                | 1d6          | 5         | +10 ft.            | Extra Attack, Stunning Strike                    | \n| 6th   | +3                | 1d6          | 6         | +15 ft.            | Ki-Empowered Strikes, Monastic Tradition Feature | \n| 7th   | +3                | 1d6          | 7         | +15 ft.            | Evasion, Stillness of Mind                       | \n| 8th   | +3                | 1d6          | 8         | +15 ft.            | Ability Score Improvement                        | \n| 9th   | +4                | 1d6          | 9         | +15 ft.            | Unarmored Movement improvement                   | \n| 10th  | +4                | 1d6          | 10        | +20 ft.            | Purity of Body                                   | \n| 11th  | +4                | 1d8          | 11        | +20 ft.            | Monastic Tradition Feature                       | \n| 12th  | +4                | 1d8          | 12        | +20 ft.            | Ability Score Improvement                        | \n| 13th  | +5                | 1d8          | 13        | +20 ft.            | Tongue of the Sun and Moon                       | \n| 14th  | +5                | 1d8          | 14        | +25 ft.            | Diamond Soul                                     | \n| 15th  | +5                | 1d8          | 15        | +25 ft.            | Timeless Body                                    | \n| 16th  | +5                | 1d8          | 16        | +25 ft.            | Ability Score Improvement                        | \n| 17th  | +6                | 1d10         | 17        | +25 ft.            | Monastic Tradition Feature                       | \n| 18th  | +6                | 1d10         | 18        | +30 ft.            | Empty Body                                       | \n| 19th  | +6                | 1d10         | 19        | +30 ft.            | Ability Score Improvement                        | \n| 20th  | +6                | 1d10         | 20        | +30 ft.            | Perfect Self                                     |",
     :spellcasting_ability=>"",
     :subtypes_name=>"Monastic Traditions",
     :archetypes=>
      [{:name=>"Way of the Open Hand",
        :slug=>"way-of-the-open-hand",
        :desc=>
         "Monks of the Way of the Open Hand are the ultimate masters of martial arts combat, whether armed or unarmed. They learn techniques to push and trip their opponents, manipulate ki to heal damage to their bodies, and practice advanced meditation that can protect them from harm. \n \n##### Open Hand Technique \n \nStarting when you choose this tradition at 3rd level, you can manipulate your enemy's ki when you harness your own. Whenever you hit a creature with one of the attacks granted by your Flurry of Blows, you can impose one of the following effects on that target: \n* It must succeed on a Dexterity saving throw or be knocked prone. \n* It must make a Strength saving throw. If it fails, you can push it up to 15 feet away from you. \n* It can't take reactions until the end of your next turn. \n \n##### Wholeness of Body \n \nAt 6th level, you gain the ability to heal yourself. As an action, you can regain hit points equal to three times your monk level. You must finish a long rest before you can use this feature again. \n \n##### Tranquility \n \nBeginning at 11th level, you can enter a special meditation that surrounds you with an aura of peace. At the end of a long rest, you gain the effect of a *sanctuary* spell that lasts until the start of your next long rest (the spell can end early as normal). The saving throw DC for the spell equals 8 + your Wisdom modifier + your proficiency bonus. \n \n##### Quivering Palm \n \nAt 17th level, you gain the ability to set up lethal vibrations in someone's body. When you hit a creature with an unarmed strike, you can spend 3 ki points to start these imperceptible vibrations, which last for a number of days equal to your monk level. The vibrations are harmless unless you use your action to end them. To do so, you and the target must be on the same plane of existence. When you use this action, the creature must make a Constitution saving throw. If it fails, it is reduced to 0 hit points. If it succeeds, it takes 10d10 necrotic damage. \n \nYou can have only one creature under the effect of this feature at a time. You can choose to end the vibrations harmlessly without using an action.",
        :document__slug=>"wotc-srd",
        :document__title=>"Systems Reference Document",
        :document__license_url=>"http://open5e.com/legal"}],
     :document__slug=>"wotc-srd",
     :document__title=>"Systems Reference Document",
     :document__license_url=>"http://open5e.com/legal"}
  end

  it "exists" do
    stats = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 20)

    expect(stats).to be_a(Stats)
    expect(stats.core_stats).to be_a(CoreStats)
    expect(stats.core_stats.stats).to be_a(Hash)
    expect(stats.core_stats.stats[:modifiers]).to be_a(Hash)
    expect(stats.core_stats.stats[:modifiers][:str_mod]).to be_a(Integer)
    expect(stats.core_stats.stats[:modifiers][:dex_mod]).to be_a(Integer)
    expect(stats.core_stats.stats[:modifiers][:con_mod]).to be_a(Integer)
    expect(stats.core_stats.stats[:modifiers][:int_mod]).to be_a(Integer)
    expect(stats.core_stats.stats[:modifiers][:wis_mod]).to be_a(Integer)
    expect(stats.core_stats.stats[:modifiers][:cha_mod]).to be_a(Integer)
    expect(stats.core_stats.stats[:scores]).to be_a(Hash)
    expect(stats.core_stats.stats[:scores][:str]).to be_a(Integer)
    expect(stats.core_stats.stats[:scores][:dex]).to be_a(Integer)
    expect(stats.core_stats.stats[:scores][:con]).to be_a(Integer)
    expect(stats.core_stats.stats[:scores][:int]).to be_a(Integer)
    expect(stats.core_stats.stats[:scores][:wis]).to be_a(Integer)
    expect(stats.core_stats.stats[:scores][:cha]).to be_a(Integer)
    expect(stats.passive_perception).to be_a(Integer)
    expect(stats.proficiency_bonus).to eq(6)
    expect(stats.hit_points).to be_a(Integer)
    expect(stats.saving_throws).to be_a(SavingThrows)
    expect(stats.saving_throws.throws).to be_a(Hash)
    expect(stats.saving_throws.throws[:str]).to be_a(Integer)
    expect(stats.saving_throws.throws[:dex]).to be_a(Integer)
    expect(stats.saving_throws.throws[:con]).to be_a(Integer)
    expect(stats.saving_throws.throws[:int]).to be_a(Integer)
    expect(stats.saving_throws.throws[:wis]).to be_a(Integer)
    expect(stats.saving_throws.throws[:cha]).to be_a(Integer)
    expect(stats.skills).to be_a(Skills)
    expect(stats.skills.proficiencies).to be_a(Array)
    expect(stats.skills.proficiencies[0]).to eq("insight")
    expect(stats.skills.proficiencies[1]).to eq("religion")
    expect(stats.skills.proficiencies[2]).to be_a(String)
    expect(stats.skills.proficiencies[3]).to be_a(String)
    expect(stats.skills.proficiencies[4]).to be_a(String)
    expect(stats.skills.proficiencies[5]).to be_a(String)
    expect(stats.skills.proficiencies[6]).to be_a(NilClass)
    expect(stats.skills.skills[:acrobatics]).to be_a(Integer)
    expect(stats.skills.skills[:animal_handling]).to be_a(Integer)
    expect(stats.skills.skills[:arcana]).to be_a(Integer)
    expect(stats.skills.skills[:athletics]).to be_a(Integer)
    expect(stats.skills.skills[:deception]).to be_a(Integer)
    expect(stats.skills.skills[:history]).to be_a(Integer)
    expect(stats.skills.skills[:insight]).to be_a(Integer)
    expect(stats.skills.skills[:intimidation]).to be_a(Integer)
    expect(stats.skills.skills[:investigation]).to be_a(Integer)
    expect(stats.skills.skills[:medicine]).to be_a(Integer)
    expect(stats.skills.skills[:nature]).to be_a(Integer)
    expect(stats.skills.skills[:perception]).to be_a(Integer)
    expect(stats.skills.skills[:performance]).to be_a(Integer)
    expect(stats.skills.skills[:persuasion]).to be_a(Integer)
    expect(stats.skills.skills[:religion]).to be_a(Integer)
    expect(stats.skills.skills[:sleight_of_hand]).to be_a(Integer)
    expect(stats.skills.skills[:stealth]).to be_a(Integer)
    expect(stats.skills.skills[:survival]).to be_a(Integer)
  end

  it "exists at every level" do
    stats_2 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 2)
    stats_3 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 3)
    stats_4 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 4)
    stats_5 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 5)
    stats_6 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 6)
    stats_7 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 7)
    stats_8 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 8)
    stats_9 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 9)
    stats_10 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 10)
    stats_11 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 11)
    stats_12 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 12)
    stats_13 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 13)
    stats_14 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 14)
    stats_15 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 15)
    stats_16 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 16)
    stats_17 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 17)
    stats_18 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 18)
    stats_19 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @data[2], 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 19)

    expect(stats_2).to be_a(Stats)
    expect(stats_3).to be_a(Stats)
    expect(stats_4).to be_a(Stats)
    expect(stats_5).to be_a(Stats)
    expect(stats_6).to be_a(Stats)
    expect(stats_7).to be_a(Stats)
    expect(stats_8).to be_a(Stats)
    expect(stats_9).to be_a(Stats)
    expect(stats_10).to be_a(Stats)
    expect(stats_11).to be_a(Stats)
    expect(stats_12).to be_a(Stats)
    expect(stats_13).to be_a(Stats)
    expect(stats_14).to be_a(Stats)
    expect(stats_15).to be_a(Stats)
    expect(stats_16).to be_a(Stats)
    expect(stats_17).to be_a(Stats)
    expect(stats_18).to be_a(Stats)
    expect(stats_19).to be_a(Stats)
  end

  it "exists at every level" do
    stats_2 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 2)
    stats_3 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 3)
    stats_4 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 4)
    stats_5 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 5)
    stats_6 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 6)
    stats_7 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 7)
    stats_8 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 8)
    stats_9 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 9)
    stats_10 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 10)
    stats_11 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 11)
    stats_12 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 12)
    stats_13 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 13)
    stats_14 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 14)
    stats_15 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 15)
    stats_16 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 16)
    stats_17 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 17)
    stats_18 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 18)
    stats_19 = Stats.new(@data[0], "No Sub Ancestry", @data[1], @monk, 'wildly unbalanced', "**_Skill Versatility._** You gain proficiency in two skills of your choice.", 19)

    expect(stats_2).to be_a(Stats)
    expect(stats_3).to be_a(Stats)
    expect(stats_4).to be_a(Stats)
    expect(stats_5).to be_a(Stats)
    expect(stats_6).to be_a(Stats)
    expect(stats_7).to be_a(Stats)
    expect(stats_8).to be_a(Stats)
    expect(stats_9).to be_a(Stats)
    expect(stats_10).to be_a(Stats)
    expect(stats_11).to be_a(Stats)
    expect(stats_12).to be_a(Stats)
    expect(stats_13).to be_a(Stats)
    expect(stats_14).to be_a(Stats)
    expect(stats_15).to be_a(Stats)
    expect(stats_16).to be_a(Stats)
    expect(stats_17).to be_a(Stats)
    expect(stats_18).to be_a(Stats)
    expect(stats_19).to be_a(Stats)
  end
end
