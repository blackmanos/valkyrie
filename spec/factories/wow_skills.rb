# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wow_skill, :class => 'Wow::Skill' do
    category_id 1
    name_en "MyString"
    name_ru "MyString"
    description_en "MyString"
    description_ru "MyString"
    icon_id "MyString"
  end
end
