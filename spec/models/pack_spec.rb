require 'rails_helper'

RSpec.describe Pack do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :things}
  end

end
