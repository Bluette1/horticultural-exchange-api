require 'rails_helper'
require 'cancan/matchers'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(build(:user)).to be_valid
    end

    it 'is valid with superadmin_role set to true' do
      expect(build(:user, :admin)).to be_valid
    end

    it 'is valid with supervisor_role set to true' do
      expect(build(:user, :supervisor)).to be_valid
    end
  end
  describe 'Associations' do
    it { should have_many(:wishes) }
    it { should have_many(:cart_items) }
  end

  describe 'Check for Abilities' do
    describe 'What Admin User can do' do
      let(:usr) { create(:user, :admin) }
      let(:ability) { Ability.new(usr) }
      it 'Admin can create a plant' do
        expect(ability).to be_able_to(:create, Plant.new)
      end
      it 'Admin can create a user' do
        expect(ability).to be_able_to(:create, User.new)
      end
    end

    describe 'What Supervisor User can do' do
      let(:usr) { create(:user, :supervisor) }
      let(:ability) { Ability.new(usr) }

      it 'Supervisor cannot create a plant' do
        expect(ability).not_to be_able_to(:create, Plant.new)
      end
      it 'Supervisor can create a user' do
        expect(ability).to be_able_to(:create, User.new)
      end
    end

    describe 'What User who is neither Admin nor Supervisor cannot do' do
      let(:usr) { create(:user) }
      let(:ability) { Ability.new(usr) }

      it 'User cannot create a plant' do
        expect(ability).not_to be_able_to(:create, Plant.new)
      end
      it 'User cannot create a user' do
        expect(ability).not_to be_able_to(:create, User.new)
      end
    end
  end
end
