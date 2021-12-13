require 'rails_helper'

RSpec.describe Users::SessionsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/users/sign_in').to route_to('users/sessions#create', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/users/sign_out').to route_to('users/sessions#destroy', format: :json)
    end
  end
end
