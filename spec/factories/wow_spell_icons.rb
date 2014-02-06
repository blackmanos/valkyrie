# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wow_spell_icon, class: 'Wow::Spell::Icon' do
    name 'wow_spell_icon.png'
  end
end
