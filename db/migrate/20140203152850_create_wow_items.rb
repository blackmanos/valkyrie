class CreateWowItems < ActiveRecord::Migration
  def change
    create_table :wow_items do |t|
      t.integer "class_id",                    limit: 1
      t.integer "subclass_id",                 limit: 1
      t.string  "name",                        default: "",   null: false
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
  end
end
