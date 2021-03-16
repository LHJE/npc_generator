require 'rails_helper'

describe NPC do
  before :each do
    @data = [{:name=>"Half-Elf",
 :slug=>"half-elf",
 :desc=>"## Half-Elf Traits\nYour half-elf character has some qualities in common with elves and some that are unique to half-elves.",
 :asi_desc=>"**_Ability Score Increase._** Your Charisma score increases by 2, and two other ability scores of your choice increase by 1.",
 :asi=>[{:attributes=>["Charisma"], :value=>2}, {:attributes=>["Other"], :value=>1}, {:attributes=>["Other"], :value=>1}],
 :age=>"**_Age._** Half-elves mature at the same rate humans do and reach adulthood around the age of 20. They live much longer than humans, however, often exceeding 180 years.",
 :alignment=>
  "**_Alignment._** Half-elves share the chaotic bent of their elven heritage. They value both personal freedom and creative expression, demonstrating neither love of leaders nor desire for followers. They chafe at rules, resent others' demands, and sometimes prove unreliable, or at least unpredictable.",
 :size=>"**_Size._** Half-elves are about the same size as humans, ranging from 5 to 6 feet tall. Your size is Medium.",
 :speed=>{:walk=>30},
 :speed_desc=>"**_Speed._** Your base walking speed is 30 feet.",
 :languages=>"**_Languages._** You can speak, read, and write Common, Elvish, and one extra language of your choice.",
 :vision=>
  "**_Darkvision._** Thanks to your elf blood, you have superior vision in dark and dim conditions. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can't discern color in darkness, only shades of gray.",
 :traits=>
  "**_Fey Ancestry._** You have advantage on saving throws against being charmed, and magic can't put you to sleep.\n\n**_Skill Versatility._** You gain proficiency in two skills of your choice.",
 :subraces=>[],
 :document__slug=>"wotc-srd",
 :document__title=>"Systems Reference Document",
 :document__license_url=>"http://open5e.com/legal"}, {:name=>"Monk",
 :slug=>"monk",
 :desc=>
  "### Unarmored Defense \n \nBeginning at 1st level, while you are wearing no armor and not wielding a shield, your AC equals 10 + your Dexterity modifier + your Wisdom modifier. \n \n### Ma
rtial Arts \n \nAt 1st level, your practice of martial arts gives you mastery of combat styles that use unarmed strikes and monk weapons, which are shortswords and any simple melee weapons th
at don't have the two- handed or heavy property. \n \nYou gain the following benefits while you are unarmed or wielding only monk weapons and you aren't wearing armor or wielding a shield: \n
 \n* You can use Dexterity instead of Strength for the attack and damage rolls of your unarmed strikes and monk weapons. \n* You can roll a d4 in place of the normal damage of your unarmed st
rike or monk weapon. This die changes as you gain monk levels, as shown in the Martial Arts column of the Monk table. \n* When you use the Attack action with an unarmed strike or a monk weapo
n on your turn, you can make one unarmed strike as a bonus action. For example, if you take the Attack action and attack with a quarterstaff, you can also make an unarmed strike as a bonus ac
tion, assuming you haven't already taken a bonus action this turn. \n \nCertain monasteries use specialized forms of the monk weapons. For example, you might use a club that is two lengths of
 wood connected by a short chain (called a nunchaku) or a sickle with a shorter, straighter blade (called a kama). Whatever name you use for a monk weapon, you can use the game statistics pro
vided for the weapon. \n \n### Ki \n \nStarting at 2nd level, your training allows you to harness the mystic energy of ki. Your access to this energy is represented by a number of ki points.
Your monk level determines the number of points you have, as shown in the Ki Points column of the Monk table. \n \nYou can spend these points to fuel various ki features. You start knowing th
ree such features: Flurry of Blows, Patient Defense, and Step of the Wind. You learn more ki features as you gain levels in this class. \n \nWhen you spend a ki point, it is unavailable until
 you finish a short or long rest, at the end of which you draw all of your expended ki back into yourself. You must spend at least 30 minutes of the rest meditating to regain your ki points.
\n \nSome of your ki features require your target to make a saving throw to resist the feature's effects. The saving throw DC is calculated as follows: \n \n**Ki save DC** = 8 + your proficie
ncy bonus + your Wisdom modifier \n \n#### Flurry of Blows \n \nImmediately after you take the Attack action on your turn, you can spend 1 ki point to make two unarmed strikes as a bonus acti
on. \n \n#### Patient Defense \n \nYou can spend 1 ki point to take the Dodge action as a bonus action on your turn. \n \n#### Step of the Wind \n \nYou can spend 1 ki point to take the Disen
gage or Dash action as a bonus action on your turn, and your jump distance is doubled for the turn. \n \n### Unarmored Movement \n \nStarting at 2nd level, your speed increases by 10 feet whi
le you are not wearing armor or wielding a shield. This bonus increases when you reach certain monk levels, as shown in the Monk table. \n \nAt 9th level, you gain the ability to move along v
ertical surfaces and across liquids on your turn without falling during the move. \n \n### Monastic Tradition \n \nWhen you reach 3rd level, you commit yourself to a monastic tradition: the W
ay of the Open Hand, the Way of Shadow, or the Way of the Four Elements, all detailed at the end of the class description. Your tradition grants you features at 3rd level and again at 6th, 11
th, and 17th level. \n \n### Deflect Missiles \n \nStarting at 3rd level, you can use your reaction to deflect or catch the missile when you are hit by a ranged weapon attack. When you do so,
 the damage you take from the attack is reduced by 1d10 + your Dexterity modifier + your monk level. \n \nIf you reduce the damage to 0, you can catch the missile if it is small enough for yo
u to hold in one hand and you have at least one hand free. If you catch a missile in this way, you can spend 1 ki point to make a ranged attack with the weapon or piece of ammunition you just
 caught, as part of the same reaction. You make this attack with proficiency, regardless of your weapon proficiencies, and the missile counts as a monk weapon for the attack, which has a norm
al range of 20 feet and a long range of 60 feet. \n \n### Ability Score Improvement \n \nWhen you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability s
core of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can't increase an ability score above 20 using this feature. \n \n### Slow Fall \n \nBegin
ning at 4th level, you can use your reaction when you fall to reduce any falling damage you take by an amount equal to five times your monk level. \n \n### Extra Attack \n \nBeginning at 5th
level, you can attack twice, instead of once, whenever you take the Attack action on your turn. \n \n### Stunning Strike \n \nStarting at 5th level, you can interfere with the flow of ki in a
n opponent's body. When you hit another creature with a melee weapon attack, you can spend 1 ki point to attempt a stunning strike. The target must succeed on a Constitution saving throw or b
e stunned until the end of your next turn. \n \n### Ki-Empowered Strikes \n \nStarting at 6th level, your unarmed strikes count as magical for the purpose of overcoming resistance and immunit
y to nonmagical attacks and damage. \n \n### Evasion \n \nAt 7th level, your instinctive agility lets you dodge out of the way of certain area effects, such as a blue dragon's lightning breat
h or a *fireball* spell. When you are subjected to an effect that allows you to make a Dexterity saving throw to take only half damage, you instead take no damage if you succeed on the saving
 throw, and only half damage if you fail. \n \n### Stillness of Mind \n \nStarting at 7th level, you can use your action to end one effect on yourself that is causing you to be charmed or fri
ghtened. \n \n### Purity of Body \n \nAt 10th level, your mastery of the ki flowing through you makes you immune to disease and poison. \n \n### Tongue of the Sun and Moon \n \nStarting at 13
th level, you learn to touch the ki of other minds so that you understand all spoken languages. Moreover, any creature that can understand a language can understand what you say. \n \n### Dia
mond Soul \n \nBeginning at 14th level, your mastery of ki grants you proficiency in all saving throws. \n \nAdditionally, whenever you make a saving throw and fail, you can spend 1 ki point
to reroll it and take the second result. \n \n### Timeless Body \n \nAt 15th level, your ki sustains you so that you suffer none of the frailty of old age, and you can't be aged magically. Yo
u can still die of old age, however. In addition, you no longer need food or water. \n \n### Empty Body \n \nBeginning at 18th level, you can use your action to spend 4 ki points to become in
visible for 1 minute. During that time, you also have resistance to all damage but force damage. \n \nAdditionally, you can spend 8 ki points to cast the *astral projection* spell, without ne
eding material components. When you do so, you can't take any other creatures with you. \n \n### Perfect Self \n \nAt 20th level, when you roll for initiative and have no ki points remaining,
 you regain 4 ki points. \n \n### Monastic Traditions \n \nThree traditions of monastic pursuit are common in the monasteries scattered across the multiverse. Most monasteries practice one tr
adition exclusively, but a few honor the three traditions and instruct each monk according to his or her aptitude and interest. All three traditions rely on the same basic techniques, divergi
ng as the student grows more adept. Thus, a monk need choose a tradition only upon reaching 3rd level.",
 :hit_dice=>"1d8",
 :hp_at_1st_level=>"8 + your Constitution modifier",
 :hp_at_higher_levels=>"1d8 (or 5) + your Constitution modifier per monk level after 1st",
 :prof_armor=>"None",
 :prof_weapons=>"Simple weapons, shortswords",
 :prof_tools=>"Choose one type of artisan's tools or one musical instrument",
 :prof_saving_throws=>"Strength, Dexterity",:prof_skills=>"Choose two from Acrobatics, Athletics, History, Insight, Religion, and Stealth",
 :equipment=>
  "You start with the following equipment, in addition to the equipment granted by your background: \n \n* (*a*) a shortsword or (*b*) any simple weapon \n* (*a*) a dungeoneer's pack or (*b*) an explorer's pack \n* 10 darts",
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
 :document__license_url=>"http://open5e.com/legal"}]
  @bard = {:name=>"Bard",
   :slug=>"bard",
   :desc=>
    "### Spellcasting \n \nYou have learned to untangle and reshape the fabric of reality in harmony with your wishes and music. \n \nYour spells are part of your vast repertoire, magic that you can tune to different situations. \n \n#### Cantrips \n \nYou know two cantrips of your choice from the bard spell list. You learn additional bard cantrips of your choice at higher levels, as shown in the Cantrips Known column of the Bard table. \n \n#### Spell Slots \n \nThe Bard table shows how many spell slots you have to cast your spells of 1st level and higher. To cast one of these spells, you must expend a slot of the spell's level or higher. You regain all expended spell slots when you finish a long rest. \n \nFor example, if you know the 1st-level spell *cure wounds* and have a 1st-level and a 2nd-level spell slot available, you can cast *cure wounds* using either slot. \n \n#### Spells Known of 1st Level and Higher \n \nYou know four 1st-level spells of your choice from the bard spell list. \n \nThe Spells Known column of the Bard table shows when you learn more bard spells of your choice. Each of these spells must be of a level for which you have spell slots, as shown on the table. For instance, when you reach 3rd level in this class, you can learn one new spell of 1st or 2nd level. \n \nAdditionally, when you gain a level in this class, you can choose one of the bard spells you know and replace it with another spell from the bard spell list, which also must be of a level for which you have spell slots. \n \n#### Spellcasting Ability \n \nCharisma is your spellcasting ability for your bard spells. Your magic comes from the heart and soul you pour into the performance of your music or oration. You use your Charisma whenever a spell refers to your spellcasting ability. In addition, you use your Charisma modifier when setting the saving throw DC for a bard spell you cast and when making an attack roll with one. \n \n**Spell save DC** = 8 + your proficiency bonus + your Charisma modifier \n \n**Spell attack modifier** = your proficiency bonus + your Charisma modifier \n \n#### Ritual Casting \n \nYou can cast any bard spell you know as a ritual if that spell has the ritual tag. \n \n#### Spellcasting Focus \n \nYou can use a musical instrument (see chapter 5, “Equipment”) as a spellcasting focus for your bard spells. \n \n### Bardic Inspiration \n \nYou can inspire others through stirring words or music. To do so, you use a bonus action on your turn to choose one creature other than yourself within 60 feet of you who can hear you. That creature gains one Bardic Inspiration die, a d6. \n \nOnce within the next 10 minutes, the creature can roll the die and add the number rolled to one ability check, attack roll, or saving throw it makes. The creature can wait until after it rolls the d20 before deciding to use the Bardic Inspiration die, but must decide before the GM says whether the roll succeeds or fails. Once the Bardic Inspiration die is rolled, it is lost. A creature can have only one Bardic Inspiration die at a time. \n \nYou can use this feature a number of times equal to your Charisma modifier (a minimum of once). You regain any expended uses when you finish a long rest. \n \nYour Bardic Inspiration die changes when you reach certain levels in this class. The die becomes a d8 at 5th level, a d10 at 10th level, and a d12 at 15th level. \n \n### Jack of All Trades \n \nStarting at 2nd level, you can add half your proficiency bonus, rounded down, to any ability check you make that doesn't already include your proficiency bonus. \n \n### Song of Rest \n \nBeginning at 2nd level, you can use soothing music or oration to help revitalize your wounded allies during a short rest. If you or any friendly creatures who can hear your performance regain hit points at the end of the short rest by spending one or more Hit Dice, each of those creatures regains an extra 1d6 hit points. \n \nThe extra hit points increase when you reach certain levels in this class: to 1d8 at 9th level, to 1d10 at 13th level, and to 1d12 at 17th level. \n \n### Bard College \n \nAt 3rd level, you delve into the advanced techniques of a bard college of your choice: the College of Lore or the College of Valor, both detailed at the end of \n \nthe class description. Your choice grants you features at 3rd level and again at 6th and 14th level. \n \n### Expertise \n \nAt 3rd level, choose two of your skill proficiencies. Your proficiency bonus is doubled for any ability check you make that uses either of the chosen proficiencies. \n \nAt 10th level, you can choose another two skill proficiencies to gain this benefit. \n \n### Ability Score Improvement \n \nWhen you reach 4th level, and again at 8th, 12th, 16th, and 19th level, you can increase one ability score of your choice by 2, or you can increase two ability scores of your choice by 1. As normal, you can't increase an ability score above 20 using this feature. \n \n### Font of Inspiration \n \nBeginning when you reach 5th level, you regain all of your expended uses of Bardic Inspiration when you finish a short or long rest. \n \n### Countercharm \n \nAt 6th level, you gain the ability to use musical notes or words of power to disrupt mind-influencing effects. As an action, you can start a performance that lasts until the end of your next turn. During that time, you and any friendly creatures within 30 feet of you have advantage on saving throws against being frightened or charmed. A creature must be able to hear you to gain this benefit. The performance ends early if you are incapacitated or silenced or if you voluntarily end it (no action required). \n \n### Magical Secrets \n \nBy 10th level, you have plundered magical knowledge from a wide spectrum of disciplines. Choose two spells from any class, including this one. A spell you choose must be of a level you can cast, as shown on the Bard table, or a cantrip. \n \nThe chosen spells count as bard spells for you and are included in the number in the Spells Known column of the Bard table. \n \nYou learn two additional spells from any class at 14th level and again at 18th level. \n \n### Superior Inspiration \n \nAt 20th level, when you roll initiative and have no uses of Bardic Inspiration left, you regain one use.",
   :hit_dice=>"1d8",
   :hp_at_1st_level=>"8 + your Constitution modifier",
   :hp_at_higher_levels=>"1d8 (or 5) + your Constitution modifier per bard level after 1st",
   :prof_armor=>"Light armor",
   :prof_weapons=>"Simple weapons, hand crossbows, longswords, rapiers, shortswords",
   :prof_tools=>"Three musical instruments of your choice",
   :prof_saving_throws=>"Dexterity, Charisma",
   :prof_skills=>"Choose any three",
   :equipment=>"You start with the following equipment, in addition to the equipment granted by your background: \n \n* (*a*) a rapier, (*b*) a longsword, or (*c*) any simple weapon \n* (*a*) a diplomat's pack or (*b*) an entertainer's pack \n* (*a*) a lute or (*b*) any other musical instrument \n* Leather armor and a dagger",
   :table=>
    "| Level | Proficiency Bonus | Features                                             | Spells Known | Cantrips Known | 1st | 2nd | 3rd | 4th | 5th | 6th | 7th | 8th | 9th | \n|-------|------------------|------------------------------------------------------|--------------|----------------|-----|-----|-----|-----|-----|-----|-----|-----|-----| \n| 1st   | +2               | Spellcasting, Bardic Inspiration (d6)                | 2            | 4              | 2   | -   | -   | -   | -   | -   | -   | -   | -   | \n| 2nd   | +2               | Jack of All Trades, Song of Rest (d6)                | 2            | 5              | 3   | -   | -   | -   | -   | -   | -   | -   | -   | \n| 3rd   | +2               | Bard College, Expertise                              | 2            | 6              | 4   | 2   | -   | -   | -   | -   | -   | -   | -   | \n| 4th   | +2               | Ability Score Improvement                            | 3            | 7              | 4   | 3   | -   | -   | -   | -   | -   | -   | -   | \n| 5th   | +3               | Bardic Inspiration (d8), Font of Inspiration         | 3            | 8              | 4   | 3   | 2   | -   | -   | -   | -   | -   | -   | \n| 6th   | +3               | Countercharm, Bard College Feature                   | 3            | 9              | 4   | 3   | 3   | -   | -   | -   | -   | -   | -   | \n| 7th   | +3               | -                                                    | 3            | 10             | 4   | 3   | 3   | 1   | -   | -   | -   | -   | -   | \n| 8th   | +3               | Ability Score Improvement                            | 3            | 11             | 4   | 3   | 3   | 2   | -   | -   | -   | -   | -   | \n| 9th   | +4               | Song of Rest (d8)                                    | 3            | 12             | 4   | 3   | 3   | 3   | 1   | -   | -   | -   | -   | \n| 10th  | +4               | Bardic Inspiration (d10), Expertise, Magical Secrets | 4            | 14             | 4   | 3   | 3   | 3   | 2   | -   | -   | -   | -   | \n| 11th  | +4               | -                                                    | 4            | 15             | 4   | 3   | 3   | 3   | 2   | 1   | -   | -   | -   | \n| 12th  | +4               | Ability Score Improvement                            | 4            | 15             | 4   | 3   | 3   | 3   | 2   | 1   | -   | -   | -   | \n| 13th  | +5               | Song of Rest (d10)                                   | 4            | 16             | 4   | 3   | 3   | 3   | 2   | 1   | 1   | -   | -   | \n| 14th  | +5               | Magical Secrets, Bard College Feature                | 4            | 18             | 4   | 3   | 3   | 3   | 2   | 1   | 1   | -   | -   | \n| 15th  | +5               | Bardic Inspiration (d12)                             | 4            | 19             | 4   | 3   | 3   | 3   | 2   | 1   | 1   | 1   | -   | \n| 16th  | +5               | Ability Score Improvement                            | 4            | 19             | 4   | 3   | 3   | 3   | 2   | 1   | 1   | 1   | -   | \n| 17th  | +6               | Song of Rest (d12)                                   | 4            | 20             | 4   | 3   | 3   | 3   | 2   | 1   | 1   | 1   | 1   | \n| 18th  | +6               | Magical Secrets                                      | 4            | 22             | 4   | 3   | 3   | 3   | 3   | 1   | 1   | 1   | 1   | \n| 19th  | +6               | Ability Score Improvement                            | 4            | 22             | 4   | 3   | 3   | 3   | 3   | 2   | 1   | 1   | 1   | \n| 20th  | +6               | Superior Inspiration                                 | 4            | 22             | 4   | 3   | 3   | 3   | 3   | 2   | 2   | 1   | 1   | ",
   :spellcasting_ability=>"Charisma",
   :subtypes_name=>"Colleges",
   :archetypes=>
    [{:name=>"College of Lore",
      :slug=>"college-of-lore",
      :desc=>
       "Bards of the College of Lore know something about most things, collecting bits of knowledge from sources as diverse as scholarly tomes and peasant tales. Whether singing folk ballads in taverns or elaborate compositions in royal courts, these bards use their gifts to hold audiences spellbound. When the applause dies down, the audience members might find themselves questioning everything they held to be true, from their faith in the priesthood of the local temple to their loyalty to the king. \n \nThe loyalty of these bards lies in the pursuit of beauty and truth, not in fealty to a monarch or following the tenets of a deity. A noble who keeps such a bard as a herald or advisor knows that the bard would rather be honest than politic. \n \nThe college's members gather in libraries and sometimes in actual colleges, complete with classrooms and dormitories, to share their lore with one another. They also meet at festivals or affairs of state, where they can expose corruption, unravel lies, and poke fun at self-important figures of authority. \n \n##### Bonus Proficiencies \n \nWhen you join the College of Lore at 3rd level, you gain proficiency with three skills of your choice. \n \n##### Cutting Words \n \nAlso at 3rd level, you learn how to use your wit to distract, confuse, and otherwise sap the confidence and competence of others. When a creature that you can see within 60 feet of you makes an attack roll, an ability check, or a damage roll, you can use your reaction to expend one of your uses of Bardic Inspiration, rolling a Bardic Inspiration die and subtracting the number rolled from the creature's roll. You can choose to use this feature after the creature makes its roll, but before the GM determines whether the attack roll or ability check succeeds or fails, or before the creature deals its damage. The creature is immune if it can't hear you or if it's immune to being charmed. \n \n##### Additional Magical Secrets \n \nAt 6th level, you learn two spells of your choice from any class. A spell you choose must be of a level you can cast, as shown on the Bard table, or a cantrip. The chosen spells count as bard spells for you but don't count against the number of bard spells you know. \n \n##### Peerless Skill \n \nStarting at 14th level, when you make an ability check, you can expend one use of Bardic Inspiration. Roll a Bardic Inspiration die and add the number rolled to your ability check. You can choose to do so after you roll the die for the ability check, but before the GM tells you whether you succeed or fail.",
      :document__slug=>"wotc-srd",
      :document__title=>"Systems Reference Document",
      :document__license_url=>"http://open5e.com/legal"}],
   :document__slug=>"wotc-srd",
   :document__title=>"Systems Reference Document",
   :document__license_url=>"http://open5e.com/legal"}
  end

  it "exists" do
    npc = NPC.new(@data[0], @data[1], 'standard array')

    expect(npc).to be_a(NPC)
    expect(npc.name).to be_a(String)
    expect(npc.gender).to be_a(String)
    expect(npc.alignment).to be_a(String)
    expect(npc.ancestry).to eq("Half-Elf")
    expect(npc.sub_ancestry).to be_a(String)
    expect(npc.class).to eq("Monk")
    expect(npc.speed).to be_a(Integer)
    expect(npc.size).to be_a(Array)
    expect(npc.size[0]).to be_a(Integer)
    expect(npc.size[1]).to be_a(String)
    expect(npc.languages).to be_a(Array)
    expect(npc.languages[0]).to be_a(String)
    expect(npc.vision).to be_a(String)
    expect(npc.traits).to be_a(String)
    expect(npc.background).to be_a(Background)
    expect(npc.background.name).to be_a(String)
    expect(npc.background.skill_proficiency_one).to be_a(String)
    expect(npc.background.skill_proficiency_two).to be_a(String)
    expect(npc.background.tool_proficiency_one).to be_a(String)
    expect(npc.background.tool_proficiency_two).to be_a(String)
    expect(npc.background.extra_languages).to be_a(String)
    expect(npc.stats).to be_a(Stats)
    expect(npc.stats.core_stats).to be_a(CoreStats)
    expect(npc.stats.core_stats.stats).to be_a(Hash)
    expect(npc.stats.core_stats.stats[:str]).to be_a(Integer)
    expect(npc.stats.core_stats.stats[:dex]).to be_a(Integer)
    expect(npc.stats.core_stats.stats[:con]).to be_a(Integer)
    expect(npc.stats.core_stats.stats[:int]).to be_a(Integer)
    expect(npc.stats.core_stats.stats[:wis]).to be_a(Integer)
    expect(npc.stats.core_stats.stats[:cha]).to be_a(Integer)
    expect(npc.stats.passive_perception).to be_a(Integer)
    expect(npc.stats.saving_throws).to be_a(SavingThrows)
    expect(npc.stats.saving_throws.throws).to be_a(Hash)
    expect(npc.stats.saving_throws.throws[:str]).to be_a(Integer)
    expect(npc.stats.saving_throws.throws[:dex]).to be_a(Integer)
    expect(npc.stats.saving_throws.throws[:con]).to be_a(Integer)
    expect(npc.stats.saving_throws.throws[:int]).to be_a(Integer)
    expect(npc.stats.saving_throws.throws[:wis]).to be_a(Integer)
    expect(npc.stats.saving_throws.throws[:cha]).to be_a(Integer)
    expect(npc.stats.skills).to be_a(Skills)
    expect(npc.stats.skills.proficiencies).to be_a(Array)
    expect(npc.stats.skills.proficiencies[0]).to be_a(String)
    expect(npc.stats.skills.skills[:acrobatics]).to be_a(Integer)
    expect(npc.stats.skills.skills[:animal_handling]).to be_a(Integer)
    expect(npc.stats.skills.skills[:arcana]).to be_a(Integer)
    expect(npc.stats.skills.skills[:athletics]).to be_a(Integer)
    expect(npc.stats.skills.skills[:deception]).to be_a(Integer)
    expect(npc.stats.skills.skills[:history]).to be_a(Integer)
    expect(npc.stats.skills.skills[:insight]).to be_a(Integer)
    expect(npc.stats.skills.skills[:intimidation]).to be_a(Integer)
    expect(npc.stats.skills.skills[:investigation]).to be_a(Integer)
    expect(npc.stats.skills.skills[:medicine]).to be_a(Integer)
    expect(npc.stats.skills.skills[:nature]).to be_a(Integer)
    expect(npc.stats.skills.skills[:perception]).to be_a(Integer)
    expect(npc.stats.skills.skills[:performance]).to be_a(Integer)
    expect(npc.stats.skills.skills[:persuasion]).to be_a(Integer)
    expect(npc.stats.skills.skills[:religion]).to be_a(Integer)
    expect(npc.stats.skills.skills[:sleight_of_hand]).to be_a(Integer)
    expect(npc.stats.skills.skills[:stealth]).to be_a(Integer)
    expect(npc.stats.skills.skills[:survival]).to be_a(Integer)
    expect(npc.proficiencies).to be_a(Proficiencies)
    expect(npc.proficiencies.armor).to be_a(String)
    expect(npc.proficiencies.weapons).to be_a(String)
    expect(npc.proficiencies.tools).to be_a(String)
  end

  it "has correct proficiencies when Bard" do
    bard = NPC.new(@data[0], @bard, 'roll for scores')

    expect(bard.stats.skills.proficiencies.length).to eq(5)
  end

end
