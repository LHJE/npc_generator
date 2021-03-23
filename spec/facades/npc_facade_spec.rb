require 'rails_helper'

RSpec.describe 'NPC Facade' do
  it "It returns npc poro" do
    npc = NPCFacade.create_npc('standard array', 1)

    expect(npc).to be_a(NPC)
    expect(npc.alignment).to be_a(String)
    expect(npc.ancestry).to be_a(String)
    expect(npc.armor_class).to be_a(Integer)
    expect(npc.background).to be_a(Background)
    expect(npc.background.equipment).to be_a(Array)
    expect(npc.background.equipment[0]).to be_a(String)
    expect(npc.background.extra_languages).to be_a(String)
    expect(npc.background.name).to be_a(String)
    expect(npc.background.personality).to be_a(Hash)
    expect(npc.background.personality[:personality]).to be_a(String)
    expect(npc.background.personality[:ideal]).to be_a(String)
    expect(npc.background.personality[:bond]).to be_a(String)
    expect(npc.background.personality[:flaw]).to be_a(String)
    expect(npc.background.skill_proficiency_one).to be_a(String)
    expect(npc.background.skill_proficiency_two).to be_a(String)
    expect(npc.background.tool_proficiency_one).to be_a(String)
    expect(npc.background.tool_proficiency_two).to be_a(String)
    expect(npc.character_class).to be_a(String)
    expect(npc.equipment).to be_a(Equipment)
    expect(npc.equipment.armor).to be_a(Array)
    expect(npc.equipment.armor[0]).to be_a(Armor) unless npc.equipment.armor[0] == ""
    expect(npc.equipment.extras).to be_a(String)
    expect(npc.equipment.gold).to be_a(String)
    expect(npc.equipment.pack).to be_a(Pack)
    expect(npc.equipment.weapons).to be_a(Array)
    expect(npc.equipment.weapons[0]).to be_a(Weapon)
    expect(npc.gender).to be_a(String)
    expect(npc.hit_dice).to be_a(String)
    expect(npc.initiative).to be_a(Integer)
    expect(npc.languages).to be_a(Array)
    expect(npc.languages[0]).to be_a(String)
    expect(npc.level).to be_a(Integer)
    expect(npc.name).to be_a(String)
    expect(npc.proficiencies).to be_a(Proficiencies)
    expect(npc.proficiencies.armor).to be_a(String)
    expect(npc.proficiencies.weapons).to be_a(String)
    expect(npc.proficiencies.tools).to be_a(String)
    expect(npc.size).to be_a(String)
    expect(npc.speed).to be_a(Integer)
    expect(npc.stats).to be_a(Stats)
    expect(npc.stats.core_stats).to be_a(CoreStats)
    expect(npc.stats.core_stats.stats).to be_a(Hash)
    expect(npc.stats.core_stats.stats[:modifiers]).to be_a(Hash)
    expect(npc.stats.core_stats.stats[:modifiers][:str_mod]).to be_a(Integer)
    expect(npc.stats.core_stats.stats[:modifiers][:dex_mod]).to be_a(Integer)
    expect(npc.stats.core_stats.stats[:modifiers][:con_mod]).to be_a(Integer)
    expect(npc.stats.core_stats.stats[:modifiers][:int_mod]).to be_a(Integer)
    expect(npc.stats.core_stats.stats[:modifiers][:wis_mod]).to be_a(Integer)
    expect(npc.stats.core_stats.stats[:modifiers][:cha_mod]).to be_a(Integer)
    expect(npc.stats.core_stats.stats[:scores]).to be_a(Hash)
    expect(npc.stats.core_stats.stats[:scores][:str]).to be_a(Integer)
    expect(npc.stats.core_stats.stats[:scores][:dex]).to be_a(Integer)
    expect(npc.stats.core_stats.stats[:scores][:con]).to be_a(Integer)
    expect(npc.stats.core_stats.stats[:scores][:int]).to be_a(Integer)
    expect(npc.stats.core_stats.stats[:scores][:wis]).to be_a(Integer)
    expect(npc.stats.core_stats.stats[:scores][:cha]).to be_a(Integer)
    expect(npc.stats.hit_points).to be_a(Integer)
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
    expect(npc.sub_ancestry).to be_a(String) unless npc.sub_ancestry.class == Hash
    expect(npc.traits).to be_a(Array)
    expect(npc.traits[0]).to be_a(String)
    expect(npc.vision).to be_a(String)
  end
end
