require 'rails_helper'

RSpec.describe Api::CartItemsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/cart_items').to route_to('api/cart_items#index', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/api/plants/1/cart_items').to route_to('api/cart_items#create', plant_id: '1', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/cart_items/1').to route_to('api/cart_items#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/cart_items/1').to route_to('api/cart_items#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/api/cart_items/1').to route_to('api/cart_items#destroy', id: '1', format: :json)
    end
  end
end
