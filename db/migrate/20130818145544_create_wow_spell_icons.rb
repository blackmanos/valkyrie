class CreateWowSpellIcons < ActiveRecord::Migration
  def change
    create_table :wow_spell_icons do |t|
      t.string :name
    end
  end
end
