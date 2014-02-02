class CreateWowSpellMechanics < ActiveRecord::Migration
  def change
    create_table :wow_spell_mechanics do |t|
      t.string :name_en
    end
  end
end
