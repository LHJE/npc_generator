require 'rails_helper'

RSpec.describe User do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of :google_token}
  end

end
