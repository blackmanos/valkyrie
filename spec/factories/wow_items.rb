# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wow_item, class: 'Wow::Item' do
    association :icon, factory: :wow_icon, strategy: :create
  end
end
