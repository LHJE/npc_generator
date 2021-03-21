require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.describe 'Dashboard Page' do
  describe 'As a visitor' do
    describe "When I visit the dashboard page" do
      it "I can see a message telling me to login to see this page" do
        visit 'user/dashboard'
        expect(page).to have_content("This Page Only Accessible by Authenticated Users. Please Log In.")
        expect(current_path).to eq(login_path)
      end
    end
  end

  describe 'As an authenticated  user' do
    before :each do
      # @bard = NPC.create()
      # @cleric = NPC.create()
      # @barbarian = NPC.create()
      # @user_1 = User.create(name: 'Jackie Chan', email: '67@67.com', password: '67', password_confirmation: '67', npcs: [@bard, @cleric])
      # @user_2 = User.create(name: 'Michelle Yeoh', email: 'my@my.com', password: 'my', password_confirmation: 'my', npcs: [@barbarian])
      # @user_3 = User.create(name: 'Cynthia Rothrock', email: '333@333.com', password: '333', password_confirmation: '333', npcs: [])
      @user_1 = User.create(name: 'Jackie Chan', email: '67@67.com', password: '67', password_confirmation: '67' )
      @user_2 = User.create(name: 'Michelle Yeoh', email: 'my@my.com', password: 'my', password_confirmation: 'my')
      @user_3 = User.create(name: 'Cynthia Rothrock', email: '333@333.com', password: '333', password_confirmation: '333')
    end

    it "I can see that I don't have friends if I don't have friends" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_3)
      visit 'user/dashboard'
      expect(page).to have_content("You currently have no NPC's saved.")
    end

    it "I can see a personalized welcome message after logging in" do
      visit login_path

      fill_in 'Email', with: @user_1.email
      fill_in 'Password', with: @user_1.password

      click_button "Log In"

      expect(page).to have_content("Logged in as Jackie Chan\nWelcome Jackie Chan!")
    end

    describe "If I'm logged in and have NPCs" do
      before :each do
        visit login_path

        fill_in 'Email', with: @user_1.email
        fill_in 'Password', with: @user_1.password

        click_button "Log In"
      end

      it "I can see a personalized greeting if I navigate away, and navigate back" do
        visit root_path
        visit 'user/dashboard'
        expect(page).to have_content('Welcome Jackie Chan!')
      end

      # it "I can see a section showing my NPCs" do
      #   expect(page).to have_content("NPCs:")
      #   expect(page).to have_content(@bard.name)
      #   expect(page).to have_content(@user_1.npcs[1].name)
      #   expect(page).to_not have_content(@user_2.npcs[0].name)
      # end
    end
  end
end
