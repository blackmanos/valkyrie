class AddSpellCostToWowSkillAbilities < ActiveRecord::Migration
  def change
    add_column :wow_skill_abilities, :spell_cost, :integer

    execute('
      UPDATE wow_skill_abilities a, wow_npc_trainers t, wow_spell_effects e
      SET a.spell_cost = t.spell_cost
      WHERE (t.spell_id = e.spell_id AND e.triggered_spell_id = a.spell_id AND e.type = 36)
    ')
  end
end
