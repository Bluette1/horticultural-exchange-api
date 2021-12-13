require 'rails_helper'
require 'devise/jwt/test_helpers'
require 'json'

RSpec.describe 'Api::PlantsController', type: :controller do
  describe 'success scenarios when current user is logged in' do
    before(:each) do
      @controller = Api::PlantsController.new
      curr_user = create(:user, email: 'user@example.com')
      sign_in curr_user
      @plant = create(:plant)
      @id = @plant.id
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, curr_user)
      request.headers['Authorization'] = auth_headers
    end

    it 'GET :index' do
      get :index
      expect(JSON.parse(response.body)[0]['id']).to eq @id
      assert_response :success
    end
  end

  describe 'success scenarios when current user is logged in as admin' do
    before(:each) do
      @controller = Api::PlantsController.new
      curr_user = create(:user, :admin, email: 'admin@example.com')
      sign_in curr_user
      @plant = create(:plant)
      @id = @plant.id
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
           params: { plant: { name: 'Aloe plant', price: 70, care: '', category: 'Outdoor Garden Plants' } }
      assert_response :success
    end

    it 'PATCH :update' do
      patch :update,
            params: { plant: { category: 'Outdoor Garden Herbs', care: 'care well' }, id: @id }
      assert_response :success
      expect(JSON.parse(response.body)['category']).to eq 'Outdoor Garden Herbs'
    end

    it 'DESTROY :destroy' do
      delete :destroy,
             params: { id: @id }
      assert_response :success
    end
  end
  describe 'failure scenarios when current user is not logged in as admin' do
    before(:each) do
      @controller = Api::PlantsController.new
      curr_user = create(:user, email: 'user@example.com')
      sign_in curr_user
      @plant = create(:plant)
      @id = @plant.id
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, curr_user)
      request.headers['Authorization'] = auth_headers
    end

    it 'POST :create' do
      post :create,
           params: { plant: { name: 'Aloe plant', price: 70, care: '', category: 'Outdoor Garden Plants' } }
      assert_response :unauthorized
    end
    it 'PATCH :update' do
      patch :update,
            params: { plant: { category: 'Outdoor Garden Herbs', care: 'care well' }, id: @id }
      assert_response :unauthorized
    end

    it 'DESTROY :destroy' do
      delete :destroy,
             params: { id: @id }
      assert_response :unauthorized
    end
  end
end
