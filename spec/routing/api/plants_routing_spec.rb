require 'rails_helper'

RSpec.describe Api::PlantsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/plants').to route_to('api/plants#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/api/plants/1').to route_to('api/plants#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/api/plants').to route_to('api/plants#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/plants/1').to route_to('api/plants#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/plants/1').to route_to('api/plants#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/api/plants/1').to route_to('api/plants#destroy', id: '1', format: :json)
    end
  end
end
