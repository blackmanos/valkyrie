class CreateWowSpellReagents < ActiveRecord::Migration
  def up
    create_table :wow_spell_reagents do |t|
      t.integer :spell_id
      t.integer :item_id
      t.integer :amount
    end

    (1..8).each_with_index do |i|
      execute("
        INSERT INTO wow_spell_reagents(spell_id, item_id, amount)
        SELECT id, reagent_#{i}, reagent_#{i}_count FROM wow_spells WHERE reagent_#{i} > 0
      ")
    end

    change_table :wow_spells do |t|
      (1..8).each_with_index do |i|
        t.remove("reagent_#{i}", "reagent_#{i}_count")
      end
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't populate spell reagents"
  end
end
