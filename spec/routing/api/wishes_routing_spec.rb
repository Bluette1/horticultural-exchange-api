require 'rails_helper'

RSpec.describe Api::WishesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/wishes').to route_to('api/wishes#index', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/api/plants/1/wishes').to route_to('api/wishes#create', plant_id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/api/wishes/1').to route_to('api/wishes#destroy', id: '1', format: :json)
    end
  end
end
