# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wow_npc_trainer, :class => 'Wow::Npc::Trainer' do
    trainer_id 1
    spell_id 1
    spell_cost 1
    required_skill_id 1
    required_skill_value 1
    required_level 1
  end
end
