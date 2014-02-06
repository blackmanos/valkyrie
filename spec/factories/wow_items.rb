# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :craft_item, class: 'Wow::Item' do
    association :item_icon, factory: :wow_icon, strategy: :create
  end
end
