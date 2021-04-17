require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.describe 'Welcome Page' do
  describe 'As a visitor' do
    before :each do
      visit root_path
    end

    it "can see field to generate NPC" do
      expect(page).to have_content("NPC Generator")
      expect(page).to have_content("Roll Up an NPC:")
      expect(page).to have_content("Score type:")
      expect(page).to have_button("Generate an NPC")
    end

    it "can see generated NPC" do
      page.has_select?('score_type', selected: 'Roll For Score')
      click_button 'Generate an NPC'

      expect(page).to have_content("NPC Generator")
      expect(page).to have_content("Here is a brand new NPC just for you")
      expect(page).to have_content("Name:")
      expect(page).to have_content("Gender:")
      expect(page).to have_content("Ancestry:")
      expect(page).to have_content("Background:")
      expect(page).to have_content("Class:")
      expect(page).to have_content("Speed:")
      expect(page).to have_content("Stats:")
      expect(page).to have_content("Passive Perception:")
      expect(page).to have_content("Core Stats:")
      expect(page).to have_content("Strength:")
      expect(page).to have_content("Dexterity:")
      expect(page).to have_content("Constitution:")
      expect(page).to have_content("Intelligence:")
      expect(page).to have_content("Wisdom:")
      expect(page).to have_content("Charisma:")
      expect(page).to have_content("Saving Throws:")
      expect(page).to have_content("Proficiencies:")
      expect(page).to have_content("Skills:")
      expect(page).to have_content("Acrobatics:")
      expect(page).to have_content("Animal Handling:")
      expect(page).to have_content("Arcana:")
      expect(page).to have_content("Athletics:")
      expect(page).to have_content("Deception:")
      expect(page).to have_content("History:")
      expect(page).to have_content("Insight:")
      expect(page).to have_content("Intimidation:")
      expect(page).to have_content("Investigation:")
      expect(page).to have_content("Medicine:")
      expect(page).to have_content("Nature:")
      expect(page).to have_content("Perception:")
      expect(page).to have_content("Performance:")
      expect(page).to have_content("Persuasion:")
      expect(page).to have_content("Religion:")
      expect(page).to have_content("Sleight of Hand:")
      expect(page).to have_content("Stealth:")
      expect(page).to have_content("Survival:")
      expect(page).to have_content("Roll Up another NPC:")
    end
  end

  describe 'As a user' do
    before :each do
      @user_1 = User.create(name: 'Jackie', email: 'Jackie@67.com', google_token: "MOCK_OMNIAUTH_GOOGLE_TOKEN", google_refresh_token: "MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN", uid: "100000000000000000000",  username: "Jackie@67.com")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)

      visit root_path
    end

    it "can see field to generate NPC" do
      expect(page).to have_content("NPC Generator")
      expect(page).to have_content("Roll Up an NPC:")
      expect(page).to have_content("Score type:")
      expect(page).to have_button("Generate an NPC")
    end

    it "can see generated NPC" do
      page.has_select?('score_type', selected: 'Roll For Score')
      click_button 'Generate an NPC'

      expect(page).to have_content("NPC Generator")
      expect(page).to have_content("Here is a brand new NPC just for you")
      expect(page).to have_content("Name:")
      expect(page).to have_content("Gender:")
      expect(page).to have_content("Ancestry:")
      expect(page).to have_content("Background:")
      expect(page).to have_content("Class:")
      expect(page).to have_content("Speed:")
      expect(page).to have_content("Stats:")
      expect(page).to have_content("Passive Perception:")
      expect(page).to have_content("Core Stats:")
      expect(page).to have_content("Strength:")
      expect(page).to have_content("Dexterity:")
      expect(page).to have_content("Constitution:")
      expect(page).to have_content("Intelligence:")
      expect(page).to have_content("Wisdom:")
      expect(page).to have_content("Charisma:")
      expect(page).to have_content("Saving Throws:")
      expect(page).to have_content("Proficiencies:")
      expect(page).to have_content("Skills:")
      expect(page).to have_content("Acrobatics:")
      expect(page).to have_content("Animal Handling:")
      expect(page).to have_content("Arcana:")
      expect(page).to have_content("Athletics:")
      expect(page).to have_content("Deception:")
      expect(page).to have_content("History:")
      expect(page).to have_content("Insight:")
      expect(page).to have_content("Intimidation:")
      expect(page).to have_content("Investigation:")
      expect(page).to have_content("Medicine:")
      expect(page).to have_content("Nature:")
      expect(page).to have_content("Perception:")
      expect(page).to have_content("Performance:")
      expect(page).to have_content("Persuasion:")
      expect(page).to have_content("Religion:")
      expect(page).to have_content("Sleight of Hand:")
      expect(page).to have_content("Stealth:")
      expect(page).to have_content("Survival:")
      expect(page).to have_content("Roll Up another NPC:")
    end
  end
end
