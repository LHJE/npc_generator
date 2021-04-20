require 'rails_helper'

RSpec.describe 'User Destruction' do
  describe 'As an authenticated user' do
    describe "When I click to delete my account" do
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
        @npcs = [NPC.new(@data[0], @data[1], 'standard array', 1), NPC.new(@data[0], @data[1], 'roll for scores', 1), NPC.new(@data[0], @data[1], 'wildly unbalanced', 1)]
        @user_1 = User.create(name: 'Jackie', email: 'Jackie@67.com', google_token: "MOCK_OMNIAUTH_GOOGLE_TOKEN", google_refresh_token: "MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN", uid: "100000000000000000000",  username: "Jackie@67.com")
        @user_2 = User.create(name: 'Michelle', email: 'Michelle@67.com', google_token: "MOCK_OMNIAUTH_GOOGLE_TOKEN_TWO", google_refresh_token: "MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN_TWO", uid: "100000000000000000002",  username: "Michelle@67.com")
        @npcs.each do |base_info|
          @npc = NpcModel.create(alignment: base_info.alignment,
                          ancestry: base_info.ancestry,
                          archetype_name: base_info.archetype.instance_of?(String) ? base_info.archetype : base_info.archetype[:name],
                          archetype_desc: base_info.archetype.instance_of?(String) ? base_info.archetype : base_info.archetype[:desc],
                          armor_class: base_info.armor_class,
                          background_equipment: base_info.background.equipment.to_s,
                          background_extra_languages: base_info.background.extra_languages,
                          background_name: base_info.background.name,
                          personality_personality: base_info.background.personality[:personality],
                          personality_ideal: base_info.background.personality[:ideal],
                          personality_bond: base_info.background.personality[:bond],
                          personality_flaw: base_info.background.personality[:flaw],
                          skill_proficiency_one: base_info.background.skill_proficiency_one,
                          skill_proficiency_two: base_info.background.skill_proficiency_two,
                          background_tool_proficiency_one: base_info.background.tool_proficiency_one,
                          background_tool_proficiency_two: base_info.background.tool_proficiency_two,
                          character_class: base_info.character_class,
                          equipment_extras: base_info.equipment.extras,
                          gold: base_info.equipment.gold,
                          gender: base_info.gender,
                          hit_dice: base_info.hit_dice,
                          initiative: base_info.initiative,
                          languages: base_info.languages.to_s,
                          level: base_info.level.to_s,
                          name: base_info.name,
                          proficiencies_armor: base_info.proficiencies.armor,
                          proficiencies_weapons: base_info.proficiencies.weapons,
                          proficiencies_tools: base_info.proficiencies.tools,
                          size: base_info.size,
                          proficiency_bonus: base_info.stats.proficiency_bonus,
                          dex_attack: base_info.stats.dex_attack,
                          str_attack: base_info.stats.str_attack,
                          speed: base_info.speed,
                          core_modifiers_str_mod: base_info.stats.core_stats.stats[:modifiers][:str_mod],
                          core_modifiers_dex_mod: base_info.stats.core_stats.stats[:modifiers][:dex_mod],
                          core_modifiers_con_mod: base_info.stats.core_stats.stats[:modifiers][:con_mod],
                          core_modifiers_int_mod: base_info.stats.core_stats.stats[:modifiers][:int_mod],
                          core_modifiers_wis_mod: base_info.stats.core_stats.stats[:modifiers][:wis_mod],
                          core_modifiers_cha_mod: base_info.stats.core_stats.stats[:modifiers][:cha_mod],
                          core_scores_str: base_info.stats.core_stats.stats[:scores][:str],
                          core_scores_dex: base_info.stats.core_stats.stats[:scores][:dex],
                          core_scores_con: base_info.stats.core_stats.stats[:scores][:con],
                          core_scores_int: base_info.stats.core_stats.stats[:scores][:int],
                          core_scores_wis: base_info.stats.core_stats.stats[:scores][:wis],
                          core_scores_cha: base_info.stats.core_stats.stats[:scores][:cha],
                          hit_points: base_info.stats.hit_points,
                          passive_perception: base_info.stats.passive_perception,
                          saving_throws_str: base_info.stats.saving_throws.throws[:str],
                          saving_throws_dex: base_info.stats.saving_throws.throws[:dex],
                          saving_throws_con: base_info.stats.saving_throws.throws[:con],
                          saving_throws_int: base_info.stats.saving_throws.throws[:int],
                          saving_throws_wis: base_info.stats.saving_throws.throws[:wis],
                          saving_throws_cha: base_info.stats.saving_throws.throws[:cha],
                          skills_proficiencies: base_info.stats.skills.proficiencies.to_s,
                          skills_acrobatics: base_info.stats.skills.skills[:acrobatics],
                          skills_animal_handling: base_info.stats.skills.skills[:animal_handling],
                          skills_arcana: base_info.stats.skills.skills[:arcana],
                          skills_athletics: base_info.stats.skills.skills[:athletics],
                          skills_deception: base_info.stats.skills.skills[:deception],
                          skills_history: base_info.stats.skills.skills[:history],
                          skills_insight: base_info.stats.skills.skills[:insight],
                          skills_intimidation: base_info.stats.skills.skills[:intimidation],
                          skills_investigation: base_info.stats.skills.skills[:investigation],
                          skills_medicine: base_info.stats.skills.skills[:medicine],
                          skills_nature: base_info.stats.skills.skills[:nature],
                          skills_perception: base_info.stats.skills.skills[:perception],
                          skills_performance: base_info.stats.skills.skills[:performance],
                          skills_persuasion: base_info.stats.skills.skills[:persuasion],
                          skills_religion: base_info.stats.skills.skills[:religion],
                          skills_sleight_of_hand: base_info.stats.skills.skills[:sleight_of_hand],
                          skills_stealth: base_info.stats.skills.skills[:stealth],
                          skills_survival: base_info.stats.skills.skills[:survival],
                          spell_slots: base_info.spells.spell_slots.instance_of?(String) ? base_info.spells.spell_slots : base_info.spells.spell_slots.to_s,
                          sub_ancestry: base_info.sub_ancestry.class == String ? base_info.sub_ancestry : base_info.sub_ancestry[:name],
                          traits: base_info.traits.to_s,
                          vision: base_info.vision,
                          is_saved: 0)
          NpcModelPack.create(npc_model_id: @npc.id, pack_id: base_info.equipment.pack.id)
          base_info.equipment.armor.each do |piece|
            NpcModelArmor.create(npc_model_id: @npc.id, armor_id: piece.id) unless piece == ""
          end
          base_info.equipment.weapons.each do |weapon|
            NpcModelWeapon.create(npc_model_id: @npc.id, weapon_id: weapon.id)
          end
        end
        UserNpcModel.create!(npc_model_id: NpcModel.order(:id)[0].id, user_id: @user_1.id)
        NpcModel.order(:id)[0].update(is_saved: 1)
        UserNpcModel.create!(npc_model_id: NpcModel.order(:id)[1].id, user_id: @user_1.id)
        NpcModel.order(:id)[1].update(is_saved: 1)
        UserNpcModel.create!(npc_model_id: NpcModel.order(:id)[2].id, user_id: @user_2.id)
        NpcModel.order(:id)[2].update(is_saved: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
        visit user_dashboard_path
      end

      it "I can delete my account" do

        expect(page).to have_button('Delete')

        first(:button, "Delete").click

        expect(current_path).to eq(root_path)
      end
    end
  end
end
