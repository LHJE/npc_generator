require 'rails_helper'

RSpec.describe 'Site Navigation' do
  describe 'As a Visitor' do
    describe 'I see a nav bar where I can link to' do
      it 'the welcome page' do
        @user = User.create(name: 'Jackie', email: 'Jackie@67.com', google_token: "MOCK_OMNIAUTH_GOOGLE_TOKEN", google_refresh_token: "MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN", uid: "100000000000000000000",  username: "Jackie@67.com")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        visit user_dashboard_path

        within 'nav' do
          click_link 'Home'
        end

        expect(current_path).to eq(root_path)
      end

      it "I can sign in with Google account" do
        visit root_path
        expect(page).to have_button("Login with Google")
        stub_omniauth
        click_button "Login with Google"
        expect(page).to have_content("Logged in as John Smith")
      end

      it "can see footer" do
        visit root_path

        expect(page).to have_content("Thank you to Open5e and D&D 5e API for providing the D&D data that is used in this application.")
        expect(page).to have_content("Further citation information regarding the data used in this project can be found here for Open5e and here for D&D 5e API.")
      end
    end
  end

  describe 'As a User' do
    before :each do
      @user = User.create(name: 'Jackie', email: 'Jackie@67.com', google_token: "MOCK_OMNIAUTH_GOOGLE_TOKEN", google_refresh_token: "MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN", uid: "100000000000000000000",  username: "Jackie@67.com")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    describe 'I see a nav bar where I can link to' do

      it 'the logout page' do
        visit root_path

        within 'nav' do
          click_link 'Log Out'
        end

        expect(current_path).to eq(root_path)
        expect(page).to have_content('You have been logged out!')
      end
    end

    describe 'I do not see in my nav bar' do
      it 'the login link' do
        visit root_path

        expect(page).to_not have_link('Login with Google')
      end
    end
  end

  describe 'As an Admin' do
    before :each do
      @admin = User.create(name: 'Michelle', email: 'Michelle@67.com', google_token: "MOCK_OMNIAUTH_GOOGLE_TOKEN_TWO", google_refresh_token: "MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN_TWO", uid: "100000000000000000002",  username: "Michelle@67.com", role: 'admin')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end

    describe 'I see a nav bar where I can link to' do
      it 'the logout page' do
        visit root_path

        within 'nav' do
          click_link 'Log Out'
        end

        expect(current_path).to eq(root_path)
        expect(page).to have_content('You have been logged out!')
      end

      it 'the User Dashboard page' do
        visit root_path

        within 'nav' do
          click_link 'Admin Dashboard'
        end

        expect(current_path).to eq('/admin/dashboard')
        expect(page).to have_content("NPC's:")
      end

      it 'the User Dashboard page' do
        visit root_path

        within 'nav' do
          click_link 'Users Dashboard'
        end

        expect(current_path).to eq('/admin/users')
        expect(page).to have_content('Users:')
      end

      it 'the NPC Dashboard page' do
        visit root_path

        within 'nav' do
          click_link 'NPCs Dashboard'
        end

        expect(current_path).to eq('/admin/npcs')
        expect(page).to have_content('NPCs')
      end
    end

    describe 'I do not see in my nav bar' do
      it 'the login link' do
        visit root_path

        expect(page).to_not have_link('Login with Google')
      end
    end
  end
end
