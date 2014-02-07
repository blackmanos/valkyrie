class AddIndexesToWowSkillAbilities < ActiveRecord::Migration
  def change
    add_index :wow_skill_abilities, :spell_id
    add_index :wow_skill_abilities, :skill_id
  end
end
