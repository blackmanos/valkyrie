class RenameSpellIconId < ActiveRecord::Migration
  def change
    rename_column :wow_spells, :spell_icon_id, :icon_id
  end
end
