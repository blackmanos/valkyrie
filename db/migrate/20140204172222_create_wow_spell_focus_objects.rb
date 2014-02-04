class CreateWowSpellFocusObjects < ActiveRecord::Migration
  def change
    create_table :wow_spell_focus_objects do |t|
      t.string :name_en
      t.string :name_ru
    end
  end
end
