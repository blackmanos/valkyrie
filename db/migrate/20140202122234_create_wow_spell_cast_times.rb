class CreateWowSpellCastTimes < ActiveRecord::Migration
  def change
    create_table :wow_spell_cast_times do |t|
      t.integer :base
    end
  end
end
