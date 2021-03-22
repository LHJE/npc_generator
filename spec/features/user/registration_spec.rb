require 'rails_helper'

RSpec.describe 'User Registration' do
  describe 'As a Visitor' do
    it "I can click link to register, and am taken to the register page" do
      visit root_path

      click_link "Register"

      expect(current_path).to eq(registration_path)
    end

    it 'I can register as a user' do
      visit registration_path

      fill_in 'user[name]', with: 'Jackie'
      fill_in 'user[email]', with: 'Jackie@example.com'
      fill_in 'user[password]', with: 'securepassword'
      fill_in 'user[password_confirmation]', with: 'securepassword'
      click_button 'Register'

      expect(current_path).to eq('/user/dashboard')
      expect(page).to have_content('Welcome, Jackie!')
    end

    describe 'I can not register as a user if' do
      it 'I do not complete the registration form' do
        visit registration_path

        fill_in 'user[name]', with: 'Jackie'
        click_button 'Register'

        expect(page).to have_button('Register')
        expect(page).to have_content("email: [\"can't be blank\"]")
        expect(page).to have_content("password: [\"can't be blank\"")
      end

      it "My password and password confirmation does not match" do
        visit registration_path

        fill_in 'user[name]', with: 'Jackie'
        fill_in 'user[email]', with: 'jackie@example.com'
        fill_in 'user[password]', with: 'securepassword'
        fill_in 'user[password_confirmation]', with: 'wrongpassword'
        click_button 'Register'

        expect(page).to have_button('Register')
      end

      it 'I use a non-unique email' do
        user = User.create(name: 'Jackie', email: 'jackie@example.com', password: 'securepassword', password_confirmation: 'securepassword')

        visit registration_path

        fill_in 'user[name]', with: user.name
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        fill_in 'user[password_confirmation]', with: user.password
        click_button 'Register'

        expect(page).to have_button('Register')
        expect(page).to have_content("email: [\"has already been taken\"]")
      end
    end
  end

  describe 'As an authenticated user' do
    describe "When I visit the register page" do
      before :each do
        @user_1 = User.create(name: 'Jackie Chan', email: '90@90.com', password: '90', password_confirmation: '90')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
        visit registration_path
      end

      it "I can see a message telling me I'm already registered" do
        expect(page).to have_content("You are already registerd.")
        expect(page).to_not have_button('Register')
        expect(page).to_not have_content("email: [\"can't be blank\"]")
        expect(page).to_not have_content("password: [\"can't be blank\"")
        expect(current_path).to eq('/user/dashboard')
      end
    end
  end
end
