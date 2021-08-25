class Users::RegistrationsController < Devise::RegistrationsController
  skip_authorization_check

  respond_to :json

  def create
    user = CreateUser.new(register_params).call
    render json: user
  end

  private

  def register_params
    params.require(:registration).permit(:email, :password)
  end
end
