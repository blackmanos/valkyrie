# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :polymorph, class: 'Wow::Spell' do
    tooltip_original_en 'Transforms the enemy into a sheep, forcing it to wander around for up to $d.'
    association :icon, factory: :wow_spell_icon, strategy: :create
  end

  factory :warsong_food, class: 'Wow::Spell' do
    buff_original_en 'Restores $/5;s1 health and $/5;s2 mana per second.'
    after(:create) do |spell|
      create :wow_effect_trigger_eat, spell: spell
      create :wow_effect_trigger_drink, spell: spell
      spell.tooltip_original_en = "Restores $#{spell.effect(1).trigger_id}o1 health and $#{spell.effect(2).trigger_id}o2 mana over $#{spell.effect(1).trigger_id}d."
    end
  end

  factory :wow_spell_eat, class: 'Wow::Spell' do
    association :duration, factory: :wow_spell_duration, strategy: :create
    after(:create) do |spell|
      create(:wow_effect_eat, spell: spell)
    end
  end

  factory :wow_spell_drink, class: 'Wow::Spell' do
    association :duration, factory: :wow_spell_duration, strategy: :create
    after(:create) do |spell|
      create(:wow_effect_drink, spell: spell)
    end
  end

  factory :craft_spell, class: 'Wow::Spell' do
    association :icon, factory: :wow_spell_icon, strategy: :create
    after(:create) do |spell|
      create(:wow_effect_craft, spell: spell)
    end
  end
end
