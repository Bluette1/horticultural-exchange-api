require 'devise'
require 'factory_bot'
module AuthenticationHelper
  def log_in_usr(usr)
    before(:each) do
      request.env['devise.mapping'] = Devise.mappings[:user]
      user = create(usr)
      sign_in user
    end
  end
end
