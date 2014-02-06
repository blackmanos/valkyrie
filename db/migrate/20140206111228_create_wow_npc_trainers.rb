class CreateWowNpcTrainers < ActiveRecord::Migration
  def change
    create_table :wow_npc_trainers do |t|
      t.integer :trainer_id
      t.integer :spell_id
      t.integer :spell_cost
      t.integer :required_skill_id
      t.integer :required_skill_value
      t.integer :required_level
    end
  end
end
