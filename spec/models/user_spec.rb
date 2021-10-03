require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:wishes) }
    it { should have_many(:cart_items) }
  end
end
