# require '../application_controller'

class Admin::UsersController < ApplicationController
  load_and_authorize_resource class: User, only: %i[index update destroy create]

  def index
    email = params[:email]
    @user = User.find_by_email!(email)
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = set_user
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def set_user
    User.find(params[:id])
  end
end
