FactoryBot.define do
  factory :user do
    email                 { FFaker::Internet.unique.email }
    password              { "password" }
    password_confirmation { "password" }
  end

  trait :admin do
    role { "admin" }
  end
end
