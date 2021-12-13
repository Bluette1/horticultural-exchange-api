require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/users').to route_to('users/registrations#create', format: :json)
    end
  end
end
