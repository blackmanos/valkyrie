class AddFkToSpellEffects < ActiveRecord::Migration
  def change
    add_foreign_key :wow_spell_effects, :wow_spells, column: 'spell_id'
    add_index :wow_spell_effects, :trigger_id
    add_index :wow_spell_effects, :item_id
  end
end
