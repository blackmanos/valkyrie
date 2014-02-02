# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wow_spell_dispel_type, :class => 'Wow::Spell::DispelType' do
    name_en "MyString"
  end
end
