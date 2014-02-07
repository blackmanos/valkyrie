class AddLearnValueToWowSkillAbility < ActiveRecord::Migration
  def change
    add_column :wow_skill_abilities, :learn_value, :integer
    execute('
      UPDATE wow_skill_abilities a, wow_npc_trainers t, wow_spell_effects e
      SET a.learn_value = t.required_skill_value
      WHERE (t.spell_id = e.spell_id AND e.triggered_spell_id = a.spell_id AND e.type = 36)
    ')
    execute('
      UPDATE wow_skill_abilities a, wow_items i, wow_spell_effects e
      SET a.learn_value = i.required_skill_rank
      WHERE (i.spellid_1 = e.spell_id AND e.triggered_spell_id = a.spell_id AND e.type = 36)
    ')
  end
end
