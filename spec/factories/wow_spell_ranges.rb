# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wow_spell_range, :class => 'Wow::Spell::Range' do
    range_min 1
    range_max 1
    name_en "MyString"
  end
end
