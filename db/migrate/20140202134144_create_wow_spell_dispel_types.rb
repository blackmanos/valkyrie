class CreateWowSpellDispelTypes < ActiveRecord::Migration
  def change
    create_table :wow_spell_dispel_types do |t|
      t.string :name_en
    end
  end
end
