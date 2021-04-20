require 'rails_helper'

RSpec.describe 'Contact Page' do
  describe 'As a visitor' do
    before :each do
      visit root_path
    end

    it "I can visit About Page" do
      click_link 'Contact Us'

      expect(page).to have_content("Got a Question? Want a new feature? Send us a message!")
      expect(page).to have_content("Name")
      expect(page).to have_content("Email")
      expect(page).to have_content("Message")
      expect(page).to have_button("Send Message")
    end

    it "I can send a message" do
      click_link 'Contact Us'

      fill_in 'Name', with: 'hello'
      fill_in 'Email', with: 'hello@gmail.com'
      fill_in 'Message', with: 'hello, it is me'

      click_button 'Send Message'

      expect(current_path).to have_content(contact_index_path)
      expect(find_field('Name').value).to eq(nil)
      expect(find_field('Email').value).to eq(nil)
      expect(find_field('Message').value).to eq('')
    end

    it "I cannot send a message without email" do
      click_link 'Contact Us'

      fill_in 'Name', with: 'hello'
      fill_in 'Message', with: 'hello, it is me'

      click_button 'Send Message'

      expect(current_path).to have_content(contact_index_path)
      expect(find_field('Name').value).to eq('hello')
      expect(find_field('Email').value).to eq('')
      expect(find_field('Message').value).to eq('hello, it is me')
    end

    it "I cannot send a message without name" do
      click_link 'Contact Us'

      fill_in 'Email', with: 'hello@gmail.com'
      fill_in 'Message', with: 'hello, it is me'

      click_button 'Send Message'

      expect(current_path).to have_content(contact_index_path)
      expect(find_field('Name').value).to eq('')
      expect(find_field('Email').value).to eq('hello@gmail.com')
      expect(find_field('Message').value).to eq('hello, it is me')
    end
  end

  describe 'As a user' do
    before :each do
      @user_1 = User.create(name: 'Jackie', email: 'Jackie@67.com', google_token: "MOCK_OMNIAUTH_GOOGLE_TOKEN", google_refresh_token: "MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN", uid: "100000000000000000000",  username: "Jackie@67.com")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)

      visit root_path
    end

    it "I can visit About Page" do
      click_link 'Contact Us'

      expect(page).to have_content("Got a Question? Want a new feature? Send us a message!")
      expect(page).to have_content("Name")
      expect(page).to have_content("Email")
      expect(page).to have_content("Message")
      expect(page).to have_button("Send Message")
    end

    it "I can send a message" do
      click_link 'Contact Us'

      fill_in 'Name', with: 'hello'
      fill_in 'Email', with: 'hello@gmail.com'
      fill_in 'Message', with: 'hello, it is me'

      click_button 'Send Message'

      expect(current_path).to have_content(contact_index_path)
      expect(find_field('Name').value).to eq(nil)
      expect(find_field('Email').value).to eq(nil)
      expect(find_field('Message').value).to eq('')
    end

    it "I cannot send a message without email" do
      click_link 'Contact Us'

      fill_in 'Name', with: 'hello'
      fill_in 'Message', with: 'hello, it is me'

      click_button 'Send Message'

      expect(current_path).to have_content(contact_index_path)
      expect(find_field('Name').value).to eq('hello')
      expect(find_field('Email').value).to eq('')
      expect(find_field('Message').value).to eq('hello, it is me')
    end

    it "I cannot send a message without name" do
      click_link 'Contact Us'

      fill_in 'Email', with: 'hello@gmail.com'
      fill_in 'Message', with: 'hello, it is me'

      click_button 'Send Message'

      expect(current_path).to have_content(contact_index_path)
      expect(find_field('Name').value).to eq('')
      expect(find_field('Email').value).to eq('hello@gmail.com')
      expect(find_field('Message').value).to eq('hello, it is me')
    end
  end

  describe 'As an admin' do
    before :each do
      @admin = User.create(name: 'Jackie', email: 'Jackie@67.com', google_token: "MOCK_OMNIAUTH_GOOGLE_TOKEN", google_refresh_token: "MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN", uid: "100000000000000000000",  username: "Jackie@67.com", role:'admin')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit root_path
    end

    it "I can visit About Page" do
      click_link 'Contact Us'

      expect(page).to have_content("Got a Question? Want a new feature? Send us a message!")
      expect(page).to have_content("Name")
      expect(page).to have_content("Email")
      expect(page).to have_content("Message")
      expect(page).to have_button("Send Message")
    end

    it "I can send a message" do
      click_link 'Contact Us'

      fill_in 'Name', with: 'hello'
      fill_in 'Email', with: 'hello@gmail.com'
      fill_in 'Message', with: 'hello, it is me'

      click_button 'Send Message'

      expect(current_path).to have_content(contact_index_path)
      expect(find_field('Name').value).to eq(nil)
      expect(find_field('Email').value).to eq(nil)
      expect(find_field('Message').value).to eq('')
    end

    it "I cannot send a message without email" do
      click_link 'Contact Us'

      fill_in 'Name', with: 'hello'
      fill_in 'Message', with: 'hello, it is me'

      click_button 'Send Message'

      expect(current_path).to have_content(contact_index_path)
      expect(find_field('Name').value).to eq('hello')
      expect(find_field('Email').value).to eq('')
      expect(find_field('Message').value).to eq('hello, it is me')
    end

    it "I cannot send a message without name" do
      click_link 'Contact Us'

      fill_in 'Email', with: 'hello@gmail.com'
      fill_in 'Message', with: 'hello, it is me'

      click_button 'Send Message'

      expect(current_path).to have_content(contact_index_path)
      expect(find_field('Name').value).to eq('')
      expect(find_field('Email').value).to eq('hello@gmail.com')
      expect(find_field('Message').value).to eq('hello, it is me')
    end
  end
end
