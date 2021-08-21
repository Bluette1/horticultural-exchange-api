class AddSupervisor < ActiveRecord::Migration[6.1]
  def change
    User.create! do |u|
      u.email     = 'test_moderator@test.com'
      u.password  = 'password'
      u.supervisor_role = true
  end
  end
end
