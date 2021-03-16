require 'rails_helper'

RSpec.describe Armor do
  describe 'Validations' do
    it {should validate_presence_of :classification}
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
    it {should validate_presence_of :armor_class}
    it {should validate_presence_of :strength}
    it {should validate_presence_of :stealth}
    it {should validate_presence_of :weight}
  end

end
