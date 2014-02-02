# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wow_spell_mechanic, :class => 'Wow::Spell::Mechanic' do
    name_en "MyString"
  end
end
