require 'rails_helper'

RSpec.describe Mod::UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/mod/users').to route_to('mod/users#index')
    end

    it 'routes to #create' do
      expect(post: '/mod/users').to route_to('mod/users#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/mod/users/1').to route_to('mod/users#destroy', id: '1')
    end
  end
end
