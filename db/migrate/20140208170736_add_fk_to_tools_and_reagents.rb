class AddFkToToolsAndReagents < ActiveRecord::Migration
  def change
    add_foreign_key :wow_spell_reagents, :wow_spells, column: :spell_id
    add_index :wow_spell_reagents, :item_id
    add_foreign_key :wow_spells_tools, :wow_spells, column: :spell_id
    add_index :wow_spells_tools, :item_id
  end
end
