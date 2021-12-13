require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(build(:category)).to be_valid
    end
  end
end
