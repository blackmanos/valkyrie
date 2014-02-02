class CreateWowSpellDurations < ActiveRecord::Migration
  def change
    create_table :wow_spell_durations do |t|
      t.integer :base
    end
  end
end
