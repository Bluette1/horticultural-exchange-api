require 'rails_helper'

RSpec.describe Wish, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(build(:wish)).to be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:plant) }
  end
end
