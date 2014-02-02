# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wow_spell_cast_time, :class => 'Wow::Spell::CastTime' do
    base 1
  end
end
