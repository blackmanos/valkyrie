class ChangeWowSpellTooltipColumnSize < ActiveRecord::Migration
  change_table :wow_spells do |t|
    t.change :tooltip_en, :string, {limit: 512}
  end
end
