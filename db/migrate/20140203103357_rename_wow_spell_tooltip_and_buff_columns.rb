class RenameWowSpellTooltipAndBuffColumns < ActiveRecord::Migration
  def change
    rename_column :wow_spells, :tooltip_en, :tooltip_original_en
    rename_column :wow_spells, :buff_en, :buff_original_en
  end
end
