# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wow_spell_duration, :class => 'Wow::Spell::Duration' do
    base 1
  end
end
