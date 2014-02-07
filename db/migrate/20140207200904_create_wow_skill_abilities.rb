class CreateWowSkillAbilities < ActiveRecord::Migration
  def change
    create_table :wow_skill_abilities do |t|
      t.integer :skill_id
      t.integer :spell_id
      t.integer :race_mask
      t.integer :class_mask
      t.integer :required_skill_value
      t.integer :forward_spell_id
      t.integer :learn_on_get_skill
      t.integer :max_value
      t.integer :min_value
      t.integer :required_training_points
    end
  end
end
