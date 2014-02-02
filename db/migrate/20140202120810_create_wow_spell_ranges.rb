class CreateWowSpellRanges < ActiveRecord::Migration
  def change
    create_table :wow_spell_ranges do |t|
      t.integer :range_min
      t.integer :range_max
      t.string :name_en
    end
  end
end
