class CreateWowSpellRadius < ActiveRecord::Migration
  def change
    create_table :wow_spell_radius do |t|
      t.integer :base
    end
  end
end
