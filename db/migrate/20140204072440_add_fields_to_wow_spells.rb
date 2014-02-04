class AddFieldsToWowSpells < ActiveRecord::Migration
  def change
    add_column :wow_spells, :power_type, :integer
    add_column :wow_spells, :name_ru, :string
    add_column :wow_spells, :rank_ru, :string
    add_column :wow_spells, :tooltip_ru, :string,             limit: 512
    add_column :wow_spells, :tooltip_original_ru, :string,    limit: 512
    add_column :wow_spells, :buff_ru, :string
    add_column :wow_spells, :buff_original_ru, :string
  end
end
