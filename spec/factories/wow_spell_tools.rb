# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wow_spell_tool, :class => 'Wow::Spell::Tools' do
    spell_id 1
    reagent_id 1
    reagent_count 1
  end
end
