class RenameSpellCastTimeIdToCastTimeId < ActiveRecord::Migration
  def change
    rename_column :wow_spells, :spell_cast_time_id, :cast_time_id
  end
end
