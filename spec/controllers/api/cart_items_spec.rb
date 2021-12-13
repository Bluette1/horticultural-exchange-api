require 'rails_helper'
require 'devise/jwt/test_helpers'
require 'json'

RSpec.describe 'Api::CartItemsController', type: :controller do
  describe 'success scenarios when current user is logged in' do
    before(:each) do
      @controller = Api::CartItemsController.new
      curr_user = create(:user, email: 'user@example.com')
      sign_in curr_user
      @cart_item = create(:cart_item, user: curr_user)
      @id = @cart_item.id
      @plant = create(:plant)
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, curr_user)
      request.headers['Authorization'] = auth_headers
    end

    it 'GET :index' do
      get :index
      expect(JSON.parse(response.body)[0]['id']).to eq @id
      assert_response :success
    end

    it 'POST :create' do
      post :create,
           params: { plant_id: @plant.id }
      assert_response :success
    end

    it 'PATCH :update' do
      patch :update,
            params: { cart_item: { quantity: 2 }, id: @id }
      assert_response :success
      expect(JSON.parse(response.body)['quantity']).to eq 2
    end

    it 'DESTROY :destroy' do
      delete :destroy,
             params: { id: @id }
      assert_response :success
    end
  end
  describe 'failure scenarios when current user is not logged in: user is redirected to sign in' do
    before(:each) do
      @controller = Api::CartItemsController.new
    end
    it 'GET :index' do
      get :index
      assert_response :found
    end

    it 'POST :create' do
      post :create,
           params: { plant_id: 1 }
      assert_response :found
    end

    it 'DESTROY :destroy' do
      delete :destroy,
             params: { id: 1 }
      assert_response :found
    end
  end
end
