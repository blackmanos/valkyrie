class AddTooltipEnAndBuffEnToWowSpells < ActiveRecord::Migration
  def change
    add_column :wow_spells, :tooltip_en, :string
    add_column :wow_spells, :buff_en, :string
  end
end
