# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wow_spell_radiu, :class => 'Wow::Spell::Radius' do
    base 1
  end
end
