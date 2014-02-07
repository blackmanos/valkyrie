class CreateWowSpellEffects < ActiveRecord::Migration
  def up
    create_table :wow_spell_effects do |t|
      t.integer :spell_id
      t.integer :number
      t.integer :type
      t.integer :die_sides
      t.integer :base_points
      t.integer :target_a
      t.integer :target_b
      t.integer :radius_id
      t.integer :aura_id
      t.integer :amplitude
      t.integer :proc_value
      t.integer :chain_target, limit: 3
      t.integer :item_id
      t.integer :misc_value
      t.integer :trigger_id
      t.float :points_per_combo_point
    end

    (1..3).each_with_index do |i|
      execute("
        INSERT INTO wow_spell_effects(
          spell_id, type, die_sides, base_points, target_a, target_b, radius_id, aura_id, amplitude, proc_value,
          chain_target, item_id, misc_value, trigger_id, points_per_combo_point, number
        ) SELECT id, effect_#{i}_id, effect_#{i}_die_sides, effect_#{i}_base_points, effect_#{i}_target_a,
          effect_#{i}_target_b, effect_#{i}_radius, effect_#{i}_aura, effect_#{i}_amplitude, effect_#{i}_proc_value,
          effect_#{i}_chain_target, effect_#{i}_item_type, effect_#{i}_misc_value, effect_#{i}_trigger_spell,
          effect_#{i}_points_per_combo_point, #{i}
        FROM wow_spells WHERE effect_#{i}_id > 0
      ")
    end

    change_table :wow_spells do |t|
      (1..3).each_with_index do |i|
        t.remove("effect_#{i}_id", "effect_#{i}_die_sides", "effect_#{i}_base_points", "effect_#{i}_target_a",
        "effect_#{i}_target_b", "effect_#{i}_radius", "effect_#{i}_aura", "effect_#{i}_amplitude", "effect_#{i}_proc_value",
        "effect_#{i}_chain_target", "effect_#{i}_item_type", "effect_#{i}_misc_value", "effect_#{i}_trigger_spell",
        "effect_#{i}_points_per_combo_point")
      end
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't populate spell effects"
  end
end
