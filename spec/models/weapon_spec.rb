require 'rails_helper'

RSpec.describe Weapon do
  describe 'Validations' do
    it {should validate_presence_of :classification}
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
    it {should validate_presence_of :damage}
    it {should validate_presence_of :weight}
    it {should validate_presence_of :properties}
  end

end
