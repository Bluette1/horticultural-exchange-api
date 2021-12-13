require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(build(:plant)).to be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:wishes) }
  end
end
