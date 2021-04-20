require 'rails_helper'

RSpec.describe "Admin Users Index" do
  describe "As an Admin" do
    before :each do
      @d_user = User.create(name: 'Scott', email: 'Scott@67.com', google_token: "MOCK_OMNIAUTH_GOOGLE_TOKEN_THREE", google_refresh_token: "MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN_THREE", uid: "100000000000000000003",  username: "Scott@67.com")
      @admin = User.create(name: 'Michelle', email: 'Michelle@67.com', google_token: "MOCK_OMNIAUTH_GOOGLE_TOKEN_TWO", google_refresh_token: "MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN_TWO", uid: "100000000000000000002",  username: "Michelle@67.com", role: 'admin')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end

    it "I can link to a list of all users" do
      visit '/'

      within 'nav' do
        click_link 'Users Dashboard'
      end

      expect(current_path).to eq('/admin/users')

      expect(page).to have_content("Users:")
      expect(page).to have_content("Name")
      expect(page).to have_content("Role")
      expect(page).to have_content("Registered")
      expect(page).to have_content("Delete?")
      expect(page).to have_link(@d_user.name)
      expect(page).to have_content("#{@d_user.role}")
      expect(page).to have_content("#{@d_user.created_at}")
      expect(page).to have_link(@admin.name)
      expect(page).to have_content("#{@admin.role}")
      expect(page).to have_content("#{@admin.created_at}")
      expect(page).to have_button("Delete")
    end

    it "I can delete a user" do
      visit '/admin/users'

      first(:button, "Delete").click

      expect(page).to_not have_link(@d_user.name)
      expect(page).to_not have_content("#{@d_user.role}")
      expect(page).to have_link(@admin.name)
      expect(page).to have_content("#{@admin.role}")
      expect(page).to have_content("#{@admin.created_at}")
    end

    it "I can delete a myself" do
      visit "/admin/users"

      2.times do
        first(:button, "Delete").click
      end

      expect(current_path).to eq("/")
      expect(page).to have_content("The #{@admin.name} account has been destroyed!")
    end
  end
end
