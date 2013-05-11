# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'example@example.com'
    password 'password'
    password_confirmation 'password'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end

  factory :confirmed_user, parent: :user do
    after(:create) { |user| user.confirm! }
  end

  factory :admin_user, parent: :confirmed_user do
    after(:create) { |user| user.add_role(:admin) }
  end
end