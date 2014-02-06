# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :polymorph, class: 'Wow::Spell' do
    tooltip_original_en 'Transforms the enemy into a sheep, forcing it to wander around for up to $d.'
    association :spell_icon, factory: :wow_spell_icon, strategy: :create
  end

  factory :warsong_food, class: 'Wow::Spell' do
    tooltip_original_en 'Restores $2o1 health and $3o2 mana over $2d.'
    buff_original_en 'Restores $/5;s1 health and $/5;s2 mana per second.'
    effect_1_id 64
    effect_2_id 64
  end

  factory :warsong_food_trigger_1, class: 'Wow::Spell' do
    effect_1_base_points 357
    effect_1_amplitude 0
  end

  factory :warsong_food_trigger_2, class: 'Wow::Spell' do
    effect_2_base_points 734
    effect_2_amplitude 0
  end

  factory :craft_spell, class: 'Wow::Spell' do
    effect_1_id 24
    association :spell_icon, factory: :wow_spell_icon, strategy: :create
  end
end
