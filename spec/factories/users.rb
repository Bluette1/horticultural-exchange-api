FactoryBot.define do
  factory :user do
    email { 'test@example.com' }
    password { 'password' }

    trait :admin do
      superadmin_role { true }
    end

    trait :supervisor do
      supervisor_role { true }
    end
  end
end
