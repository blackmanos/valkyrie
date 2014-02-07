# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wow_spell_effect, class: 'Wow::Spell::Effect' do
    type 1
    die_sides 1
    base_points 1
    target_a 1
    target_b 1
    radius_id 1
    aura_id 1
    amplitude 1
    proc_value 1
    chain_target 1
    item_id 1
    misc_value 1
    trigger_id 1
    number 1
    points_per_combo_point 1.5
  end

  factory :wow_effect_trigger_eat, class: 'Wow::Spell::Effect' do
    type 64
    number 1
    association :trigger, factory: :wow_spell_eat, strategy: :create
  end

  factory :wow_effect_trigger_drink, class: 'Wow::Spell::Effect' do
    type 64
    number 2
    association :trigger, factory: :wow_spell_drink, strategy: :create
  end

  factory :wow_effect_eat, class: 'Wow::Spell::Effect' do
    base_points 357
    amplitude 0
    number 1
  end

  factory :wow_effect_drink, class: 'Wow::Spell::Effect' do
    base_points 734
    amplitude 0
    number 2
  end

  factory :wow_effect_craft, class: 'Wow::Spell::Effect' do
    type 24
    association :item, factory: :wow_item, strategy: :create
  end
end
