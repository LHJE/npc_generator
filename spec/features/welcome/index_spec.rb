require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.describe 'Welcome Page' do
  describe 'As a visitor' do
    before :each do
      visit root_path
    end

    it "can see welcome page text" do
      expect(page).to have_content("NPC Generator")
      expect(page).to have_content("Here is a brand new NPC just for you")
      expect(page).to have_content("Name:")
      expect(page).to have_content("Gender:")
      expect(page).to have_content("Ancestry:")
      expect(page).to have_content("Background:")
      expect(page).to have_content("Class:")
    end
  end
end
