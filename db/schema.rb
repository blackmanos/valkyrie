# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140203160635) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id", using: :btree

  create_table "database_connections", force: true do |t|
    t.string "name",               default: "Realmlist"
    t.string "host"
    t.string "kind",               default: "realm"
    t.string "adapter",            default: "mysql2"
    t.string "username"
    t.binary "encrypted_password"
    t.string "database"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "settings", force: true do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "wow_icons", force: true do |t|
    t.string "icon"
  end

  create_table "wow_items", force: true do |t|
    t.integer "class_id",                    limit: 1
    t.integer "subclass_id",                 limit: 1
    t.string  "name",                                   default: "",   null: false
    t.integer "display_id"
    t.integer "quality",                     limit: 1
    t.integer "flags"
    t.integer "buy_count",                   limit: 1
    t.integer "buy_price"
    t.integer "sell_price"
    t.integer "inventory_type",              limit: 1
    t.integer "allowable_class",             limit: 3
    t.integer "allowable_race",              limit: 3
    t.integer "item_level",                  limit: 1
    t.integer "required_level",              limit: 1
    t.integer "required_skill",              limit: 2
    t.integer "required_skill_rank",         limit: 2
    t.integer "required_spell"
    t.integer "required_honor_rank"
    t.integer "required_city_rank"
    t.integer "required_reputation_faction", limit: 2
    t.integer "required_reputation_rank",    limit: 2
    t.integer "maxcount",                    limit: 2,  default: 0,    null: false
    t.integer "stackable",                   limit: 2,  default: 1,    null: false
    t.integer "container_slots",             limit: 1
    t.integer "stat_type1",                  limit: 1,  default: 0,    null: false
    t.integer "stat_value1",                 limit: 2,  default: 0,    null: false
    t.integer "stat_type2",                  limit: 1,  default: 0,    null: false
    t.integer "stat_value2",                 limit: 2,  default: 0,    null: false
    t.integer "stat_type3",                  limit: 1,  default: 0,    null: false
    t.integer "stat_value3",                 limit: 2,  default: 0,    null: false
    t.integer "stat_type4",                  limit: 1,  default: 0,    null: false
    t.integer "stat_value4",                 limit: 2,  default: 0,    null: false
    t.integer "stat_type5",                  limit: 1,  default: 0,    null: false
    t.integer "stat_value5",                 limit: 2,  default: 0,    null: false
    t.integer "stat_type6",                  limit: 1,  default: 0,    null: false
    t.integer "stat_value6",                 limit: 2,  default: 0,    null: false
    t.integer "stat_type7",                  limit: 1,  default: 0,    null: false
    t.integer "stat_value7",                 limit: 2,  default: 0,    null: false
    t.integer "stat_type8",                  limit: 1,  default: 0,    null: false
    t.integer "stat_value8",                 limit: 2,  default: 0,    null: false
    t.integer "stat_type9",                  limit: 1,  default: 0,    null: false
    t.integer "stat_value9",                 limit: 2,  default: 0,    null: false
    t.integer "stat_type10",                 limit: 1,  default: 0,    null: false
    t.integer "stat_value10",                limit: 2,  default: 0,    null: false
    t.float   "dmg_min1",                               default: 0.0,  null: false
    t.float   "dmg_max1",                               default: 0.0,  null: false
    t.integer "dmg_type1",                   limit: 1,  default: 0,    null: false
    t.float   "dmg_min2",                               default: 0.0,  null: false
    t.float   "dmg_max2",                               default: 0.0,  null: false
    t.integer "dmg_type2",                   limit: 1,  default: 0,    null: false
    t.float   "dmg_min3",                               default: 0.0,  null: false
    t.float   "dmg_max3",                               default: 0.0,  null: false
    t.integer "dmg_type3",                   limit: 1,  default: 0,    null: false
    t.float   "dmg_min4",                               default: 0.0,  null: false
    t.float   "dmg_max4",                               default: 0.0,  null: false
    t.integer "dmg_type4",                   limit: 1,  default: 0,    null: false
    t.float   "dmg_min5",                               default: 0.0,  null: false
    t.float   "dmg_max5",                               default: 0.0,  null: false
    t.integer "dmg_type5",                   limit: 1,  default: 0,    null: false
    t.integer "armor",                       limit: 2,  default: 0,    null: false
    t.integer "holy_res",                    limit: 1,  default: 0,    null: false
    t.integer "fire_res",                    limit: 1,  default: 0,    null: false
    t.integer "nature_res",                  limit: 1,  default: 0,    null: false
    t.integer "frost_res",                   limit: 1,  default: 0,    null: false
    t.integer "shadow_res",                  limit: 1,  default: 0,    null: false
    t.integer "arcane_res",                  limit: 1,  default: 0,    null: false
    t.integer "delay",                       limit: 2,  default: 1000, null: false
    t.integer "ammo_type",                   limit: 1,  default: 0,    null: false
    t.float   "ranged_mod_range"
    t.integer "spellid_1",                   limit: 3,  default: 0,    null: false
    t.integer "spelltrigger_1",              limit: 1,  default: 0,    null: false
    t.integer "spellcharges_1",              limit: 1,  default: 0,    null: false
    t.float   "spellppmRate_1",                         default: 0.0,  null: false
    t.integer "spellcooldown_1",                        default: -1,   null: false
    t.integer "spellcategory_1",             limit: 2,  default: 0,    null: false
    t.integer "spellcategorycooldown_1",                default: -1,   null: false
    t.integer "spellid_2",                   limit: 3,  default: 0,    null: false
    t.integer "spelltrigger_2",              limit: 1,  default: 0,    null: false
    t.integer "spellcharges_2",              limit: 1,  default: 0,    null: false
    t.float   "spellppmRate_2",                         default: 0.0,  null: false
    t.integer "spellcooldown_2",                        default: -1,   null: false
    t.integer "spellcategory_2",             limit: 2,  default: 0,    null: false
    t.integer "spellcategorycooldown_2",                default: -1,   null: false
    t.integer "spellid_3",                   limit: 3,  default: 0,    null: false
    t.integer "spelltrigger_3",              limit: 1,  default: 0,    null: false
    t.integer "spellcharges_3",              limit: 1,  default: 0,    null: false
    t.float   "spellppmRate_3",                         default: 0.0,  null: false
    t.integer "spellcooldown_3",                        default: -1,   null: false
    t.integer "spellcategory_3",             limit: 2,  default: 0,    null: false
    t.integer "spellcategorycooldown_3",                default: -1,   null: false
    t.integer "spellid_4",                   limit: 3,  default: 0,    null: false
    t.integer "spelltrigger_4",              limit: 1,  default: 0,    null: false
    t.integer "spellcharges_4",              limit: 1,  default: 0,    null: false
    t.float   "spellppmRate_4",                         default: 0.0,  null: false
    t.integer "spellcooldown_4",                        default: -1,   null: false
    t.integer "spellcategory_4",             limit: 2,  default: 0,    null: false
    t.integer "spellcategorycooldown_4",                default: -1,   null: false
    t.integer "spellid_5",                   limit: 3,  default: 0,    null: false
    t.integer "spelltrigger_5",              limit: 1,  default: 0,    null: false
    t.integer "spellcharges_5",              limit: 1,  default: 0,    null: false
    t.float   "spellppmRate_5",                         default: 0.0,  null: false
    t.integer "spellcooldown_5",                        default: -1,   null: false
    t.integer "spellcategory_5",             limit: 2,  default: 0,    null: false
    t.integer "spellcategorycooldown_5",                default: -1,   null: false
    t.integer "bonding",                     limit: 1,  default: 0,    null: false
    t.string  "description",                            default: "",   null: false
    t.integer "page_text"
    t.integer "language_id",                 limit: 1
    t.integer "page_material",               limit: 1
    t.integer "start_quest"
    t.integer "lock_id"
    t.integer "material",                    limit: 1
    t.integer "sheath",                      limit: 1,  default: 0,    null: false
    t.integer "random_property"
    t.integer "block",                       limit: 3,  default: 0,    null: false
    t.integer "itemset",                     limit: 3,  default: 0,    null: false
    t.integer "max_durability",              limit: 2
    t.integer "area",                        limit: 3,  default: 0,    null: false
    t.integer "map",                         limit: 2
    t.integer "bag_family",                  limit: 3
    t.integer "disenchant_id"
    t.integer "food_type",                   limit: 1
    t.integer "min_money_loot"
    t.integer "max_money_loot"
    t.integer "duration"
    t.binary  "extra_flags",                 limit: 1
    t.string  "script_name",                 limit: 64
    t.string  "lua_script_name",             limit: 64
  end

  create_table "wow_spell_cast_times", force: true do |t|
    t.integer "base"
  end

  create_table "wow_spell_dispel_types", force: true do |t|
    t.string "name_en"
  end

  create_table "wow_spell_durations", force: true do |t|
    t.integer "base"
  end

  create_table "wow_spell_icons", force: true do |t|
    t.string "name"
  end

  create_table "wow_spell_mechanics", force: true do |t|
    t.string "name_en"
  end

  create_table "wow_spell_radius", force: true do |t|
    t.integer "base"
  end

  create_table "wow_spell_ranges", force: true do |t|
    t.integer "range_min"
    t.integer "range_max"
    t.string  "name_en"
  end

  create_table "wow_spells", force: true do |t|
    t.integer "resistance_id",                   limit: 2
    t.integer "dispel_type_id",                  limit: 2
    t.integer "mechanic_id",                     limit: 2
    t.integer "spell_cast_time_id"
    t.integer "cooldown"
    t.integer "channel_interrupt_flags"
    t.integer "proc_chance"
    t.integer "proc_charges"
    t.integer "level"
    t.integer "duration_id"
    t.integer "power_cost"
    t.integer "range_id"
    t.integer "tool_1"
    t.integer "tool_2"
    t.integer "reagent_1"
    t.integer "reagent_2"
    t.integer "reagent_3"
    t.integer "reagent_4"
    t.integer "reagent_5"
    t.integer "reagent_6"
    t.integer "reagent_7"
    t.integer "reagent_8"
    t.integer "reagent_1_count"
    t.integer "reagent_2_count"
    t.integer "reagent_3_count"
    t.integer "reagent_4_count"
    t.integer "reagent_5_count"
    t.integer "reagent_6_count"
    t.integer "reagent_7_count"
    t.integer "reagent_8_count"
    t.integer "effect_1_id"
    t.integer "effect_2_id"
    t.integer "effect_3_id"
    t.integer "effect_1_die_sides",              limit: 8
    t.integer "effect_2_die_sides",              limit: 8
    t.integer "effect_3_die_sides",              limit: 8
    t.integer "effect_1_base_points",            limit: 8
    t.integer "effect_2_base_points",            limit: 8
    t.integer "effect_3_base_points",            limit: 8
    t.integer "effect_1_target_a",               limit: 8
    t.integer "effect_2_target_a",               limit: 8
    t.integer "effect_3_target_a",               limit: 8
    t.integer "effect_1_target_b",               limit: 8
    t.integer "effect_2_target_b",               limit: 8
    t.integer "effect_3_target_b",               limit: 8
    t.integer "effect_1_radius"
    t.integer "effect_2_radius"
    t.integer "effect_3_radius"
    t.integer "effect_1_aura",                   limit: 8
    t.integer "effect_2_aura",                   limit: 8
    t.integer "effect_3_aura",                   limit: 8
    t.integer "effect_1_amplitude",              limit: 8
    t.integer "effect_2_amplitude",              limit: 8
    t.integer "effect_3_amplitude",              limit: 8
    t.integer "effect_1_proc_value"
    t.integer "effect_2_proc_value"
    t.integer "effect_3_proc_value"
    t.integer "effect_1_chain_target",           limit: 3
    t.integer "effect_2_chain_target",           limit: 3
    t.integer "effect_3_chain_target",           limit: 3
    t.integer "effect_1_item_type"
    t.integer "effect_2_item_type"
    t.integer "effect_3_item_type"
    t.integer "effect_1_misc_value",             limit: 8
    t.integer "effect_2_misc_value",             limit: 8
    t.integer "effect_3_misc_value",             limit: 8
    t.integer "effect_1_trigger_spell"
    t.integer "effect_2_trigger_spell"
    t.integer "effect_3_trigger_spell"
    t.float   "effect_1_points_per_combo_point"
    t.float   "effect_2_points_per_combo_point"
    t.float   "effect_3_points_per_combo_point"
    t.integer "spell_icon_id"
    t.string  "name_en"
    t.string  "rank_en"
    t.string  "tooltip_original_en",             limit: 512
    t.string  "buff_original_en"
    t.integer "power_cost_percent"
    t.integer "affected_target_level"
    t.integer "targets"
    t.float   "dmg_multiplier_1"
    t.float   "dmg_multiplier_2"
    t.float   "dmg_multiplier_3"
    t.string  "tooltip_en",                      limit: 512
    t.string  "buff_en"
  end

end
