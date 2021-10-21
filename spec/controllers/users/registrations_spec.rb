require 'rails_helper'

RSpec.describe 'Users::RegistrationsController', type: :controller do
  describe 'success scenarios when the user is successfully logged in' do
    before(:each) do
      @controller = Users::RegistrationsController.new
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    it 'POST :create' do
      post :create,
           params: { registration: { email: 'testing@example.com', password: 'password123&' } }
      assert_response :success
    end
  end
end
