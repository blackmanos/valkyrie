# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wow_icon, :class => 'Wow::Icon' do
    icon "MyString"
  end
end
