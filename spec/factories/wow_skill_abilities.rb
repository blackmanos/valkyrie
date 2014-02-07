# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wow_skill_ability, :class => 'Wow::SkillAbility' do
    skill_id 1
    spell_id 1
    race_mask 1
    class_mask 1
    required_skill_value 1
    forward_spell_id 1
    learn_on_get_skill 1
    max_value 1
    min_value 1
    required_training_points 1
  end
end
