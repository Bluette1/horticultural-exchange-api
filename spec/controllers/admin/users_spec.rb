require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'Admin::UsersController', type: :controller do
  describe 'success scenarios when current user is admin' do
    before(:each) do
      @controller = Admin::UsersController.new
      admin_user = create(:user, :admin, email: 'admin@example.com')
      sign_in admin_user
      user = create(:user)
      @email = user.email
      @id = user.id
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, admin_user)
      request.headers['Authorization'] = auth_headers
    end

    it 'GET :index' do
      get :index,
          params: { email: @email }
      assert_response :success
    end

    it 'POST :create' do
      post :create,
           params: { user: { email: 'testing@example.com', password: 'password123&' } }
      assert_response :success
    end

    it 'DESTROY :destroy' do
      delete :destroy,
             params: { id: @id }
      assert_response :success
    end
  end
  describe 'failure scenarios when current user is not admin' do
    before(:each) do
      @controller = Admin::UsersController.new
      curr_user = create(:user, email: 'user@example.com')
      sign_in curr_user
      user = create(:user)
      @email = user.email
      @id = user.id
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, curr_user)
      request.headers['Authorization'] = auth_headers
    end

    it 'GET :index' do
      get :index,
          params: { email: @email }
      assert_response :unauthorized
    end

    it 'POST :create' do
      post :create,
           params: { user: { email: 'testing@example.com', password: 'password123&' } }
      assert_response :unauthorized
    end

    it 'DESTROY :destroy' do
      delete :destroy,
             params: { id: @id }
      assert_response :unauthorized
    end
  end
end
