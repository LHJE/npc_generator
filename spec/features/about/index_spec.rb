require 'rails_helper'

RSpec.describe 'About Page' do
  describe 'As a visitor' do
    before :each do
      visit root_path
    end

    it "I can visit About Page" do
      click_link 'About'

      expect(page).to have_content("About Us:")
    end
  end

  describe 'As a user' do
    before :each do
      @user_1 = User.create(name: 'Jackie', email: 'Jackie@67.com', google_token: "MOCK_OMNIAUTH_GOOGLE_TOKEN", google_refresh_token: "MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN", uid: "100000000000000000000",  username: "Jackie@67.com")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)

      visit root_path
    end

    it "I can visit About Page" do
      click_link 'About'

      expect(page).to have_content("About Us:")
    end
  end

  describe 'As an admin' do
    before :each do
      @admin = User.create(name: 'Jackie', email: 'Jackie@67.com', google_token: "MOCK_OMNIAUTH_GOOGLE_TOKEN", google_refresh_token: "MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN", uid: "100000000000000000000",  username: "Jackie@67.com", role:'admin')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit root_path
    end

    it "I can visit About Page" do
      click_link 'About'

      expect(page).to have_content("About Us:")
    end
  end
end
