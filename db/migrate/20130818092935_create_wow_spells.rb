class CreateWowSpells < ActiveRecord::Migration
  def change
    create_table :wow_spells do |t|
      t.integer :resistance_id, limit: 2
      t.integer :dispel_type_id, limit: 2
      t.integer :mechanic_id, limit: 2
      t.references :spell_cast_time
      t.integer :cooldown
      t.integer :channel_interrupt_flags
      t.integer :proc_chance, limit: 4
      t.integer :proc_charges, limit: 4
      t.integer :level
      t.references :duration
      t.integer :power_cost
      t.references :range
      t.integer :tool_1
      t.integer :tool_2
      t.integer :reagent_1
      t.integer :reagent_2
      t.integer :reagent_3
      t.integer :reagent_4
      t.integer :reagent_5
      t.integer :reagent_6
      t.integer :reagent_7
      t.integer :reagent_8
      t.integer :reagent_1_count
      t.integer :reagent_2_count
      t.integer :reagent_3_count
      t.integer :reagent_4_count
      t.integer :reagent_5_count
      t.integer :reagent_6_count
      t.integer :reagent_7_count
      t.integer :reagent_8_count
      t.integer :effect_1_id
      t.integer :effect_2_id
      t.integer :effect_3_id
      t.integer :effect_1_die_sides, limit: 7
      t.integer :effect_2_die_sides, limit: 7
      t.integer :effect_3_die_sides, limit: 7
      t.integer :effect_1_base_points, limit: 7
      t.integer :effect_2_base_points, limit: 7
      t.integer :effect_3_base_points, limit: 7
      t.integer :effect_1_target_a, limit: 5
      t.integer :effect_2_target_a, limit: 5
      t.integer :effect_3_target_a, limit: 5
      t.integer :effect_1_target_b, limit: 5
      t.integer :effect_2_target_b, limit: 5
      t.integer :effect_3_target_b, limit: 5
      t.integer :effect_1_radius
      t.integer :effect_2_radius
      t.integer :effect_3_radius
      t.integer :effect_1_aura, limit: 6
      t.integer :effect_2_aura, limit: 6
      t.integer :effect_3_aura, limit: 6
      t.integer :effect_1_amplitude, limit: 8
      t.integer :effect_2_amplitude, limit: 8
      t.integer :effect_3_amplitude, limit: 8
      t.integer :effect_1_proc_value
      t.integer :effect_2_proc_value
      t.integer :effect_3_proc_value
      t.integer :effect_1_chain_target, limit: 3
      t.integer :effect_2_chain_target, limit: 3
      t.integer :effect_3_chain_target, limit: 3
      t.integer :effect_1_item_type
      t.integer :effect_2_item_type
      t.integer :effect_3_item_type
      t.integer :effect_1_misc_value, limit: 7
      t.integer :effect_2_misc_value, limit: 7
      t.integer :effect_3_misc_value, limit: 7
      t.integer :effect_1_trigger_spell
      t.integer :effect_2_trigger_spell
      t.integer :effect_3_trigger_spell
      t.float :effect_1_points_per_combo_point
      t.float :effect_2_points_per_combo_point
      t.float :effect_3_points_per_combo_point
      t.references :spell_icon
      t.string :name_en
      t.string :rank_en
      t.string :tooltip_en, limit: 512
      t.string :buff_en
      t.integer :power_cost_percent
      t.integer :affected_target_level
      t.integer :targets
      t.float :dmg_multiplier_1
      t.float :dmg_multiplier_2
      t.float :dmg_multiplier_3
    end
  end
end
