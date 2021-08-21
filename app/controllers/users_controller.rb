class UsersController < ApplicationController
  load_and_authorize_resource class: User, only: %i[update destroy create]

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
    User.find_by_email!(user_params[:email])
  end
end
