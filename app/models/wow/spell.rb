class Wow::Spell < ActiveRecord::Base
  SCHOOLS = %w(physical holy fire nature frost shadow arcane)
  AURA_NAMES = [
      'None',
      'Bind Sight',
      'Mod Possess',
      'Periodic Damage',
      'Dummy',
      'Mod Confuse',
      'Mod Charm',
      'Mod Fear',
      'Periodic Heal',
      'Mod Attack Speed',
      'Mod Threat',
      'Taunt',
      'Stun',
      'Mod Damage Done',
      'Mod Damage Taken',
      'Damage Shield',
      'Mod Stealth',
      'Mod Detect',
      'Mod Invisibility',
      'Mod Invisibility Detection',
      'OBS Mod Intellect',
      'OBS Mod Spirit',
      'Mod Resistance',
      'Periodic Trigger',
      'Periodic Energize',
      'Pacify',
      'Root',
      'Silence',
      'Reflect Spells %',
      'Mod Stat',
      'Mod Skill',
      'Mod Speed',
      'Mod Speed Mounted',
      'Mod Speed Slow',
      'Mod Increase Health',
      'Mod Increase Energy',
      'Shapeshift',
      'Immune Effect',
      'Immune State',
      'Immune School',
      'Immune Damage',
      'Immune Dispel Type',
      'Proc Trigger Spell',
      'Proc Trigger Damage',
      'Track Creatures',
      'Track Resources',
      'Mod Parry Skill',
      'Mod Parry Percent',
      'Mod Dodge Skill',
      'Mod Dodge Percent',
      'Mod Block Skill',
      'Mod Block Percent',
      'Mod Crit Percent',
      'Periodic Leech',
      'Mod Hit Chance',
      'Mod Spell Hit Chance',
      'Transform',
      'Mod Spell Crit Chance',
      'Mod Speed Swim',
      'Mod Creature Dmg Done',
      'Pacify & Silence',
      'Mod Scale',
      'Periodic Health Funnel',
      'Periodic Mana Funnel',
      'Periodic Mana Leech',
      'Haste - Spells',
      'Feign Death',
      'Disarm',
      'Mod Stalked',
      'School Absorb',
      'Extra Attacks',
      'Mod School Spell Crit Chance',
      'Mod Power Cost',
      'Mod School Power Cost',
      'Reflect School Spells %',
      'Mod Language',
      'Far Sight',
      'Immune Mechanic',
      'Mounted',
      'Mod Dmg %',
      'Mod Stat %',
      'Split Damage',
      'Water Breathing',
      'Mod Base Resistance',
      'Mod Health Regen',
      'Mod Power Regen',
      'Create Death Item',
      'Mod Dmg % Taken',
      'Mod Health Regen Percent',
      'Periodic Damage Percent',
      'Mod Resist Chance',
      'Mod Detect Range',
      'Prevent Fleeing',
      'Mod Uninteractible',
      'Interrupt Regen',
      'Ghost',
      'Spell Magnet',
      'Mana Shield',
      'Mod Skill Talent',
      'Mod Attack Power',
      'Auras Visible',
      'Mod Resistance %',
      'Mod Creature Attack Power',
      'Mod Total Threat (Fade)',
      'Water Walk',
      'Feather Fall',
      'Hover',
      'Add Flat Modifier',
      'Add % Modifier',
      'Add Class Target Trigger',
      'Mod Power Regen %',
      'Add Class Caster Hit Trigger',
      'Override Class Scripts',
      'Mod Ranged Dmg Taken',
      'Mod Ranged % Dmg Taken',
      'Mod Healing',
      'Regen During Combat',
      'Mod Mechanic Resistance',
      'Mod Healing %',
      'Share Pet Tracking',
      'Untrackable',
      'Empathy (Lore, whatever)',
      'Mod Offhand Dmg %',
      'Mod Power Cost %',
      'Mod Ranged Attack Power',
      'Mod Melee Dmg Taken',
      'Mod Melee % Dmg Taken',
      'Rngd Atk Pwr Attckr Bonus',
      'Mod Possess Pet',
      'Mod Speed Always',
      'Mod Mounted Speed Always',
      'Mod Creature Ranged Attack Power',
      'Mod Increase Energy %',
      'Mod Max Health %',
      'Mod Interrupted Mana Regen',
      'Mod Healing Done',
      'Mod Healing Done %',
      'Mod Total Stat %',
      'Haste - Melee',
      'Force Reaction',
      'Haste - Ranged',
      'Haste - Ranged (Ammo Only)',
      'Mod Base Resistance %',
      'Mod Resistance Exclusive',
      'Safe Fall',
      'Charisma',
      'Persuaded',
      'Add Creature Immunity',
      'Retain Combo Points',
      'Resist Pushback',
      'Mod Shield Block %',
      'Track Stealthed',
      'Mod Detected Range',
      'Split Damage Flat',
      'Stealth Level Modifier',
      'Mod Water Breathing',
      'Mod Reputation Gain',
      'Mod Pet Damage'
  ]

  EFFECTS = [
      'None',
      'Instakill',
      'School Damage',
      'Dummy',
      'Portal Teleport',
      'Teleport Units',
      'Apply Aura',
      'Environmental Damage',
      'Power Drain',
      'Health Leech',
      'Heal',
      'Bind',
      'Portal',
      'Ritual Base',
      'Ritual Specialize',
      'Ritual Activate Portal',
      'Quest Complete',
      'Weapon Damage + (noschool)',
      'Resurrect',
      'Extra Attacks',
      'Dodge',
      'Evade',
      'Parry',
      'Block',
      'Create Item',
      'Weapon',
      'Defense',
      'Persistent Area Aura',
      'Summon',
      'Leap',
      'Energize',
      'Weapon % Dmg',
      'Trigger Missile',
      'Open Lock',
      'UNUSED',
      'Apply Area Aura',
      'Learn Spell',
      'Spell Defense',
      'Dispel',
      'Language',
      'Dual Wield',
      'Summon Wild',
      'Summon Guardian',
      'UNUSED',
      'Skill Step',
      'UNUSED',
      'Spawn',
      'Spell Cast UI',
      'Stealth',
      'Detect',
      'Summon Object',
      'Force Critical Hit',
      'Guarantee Hit',
      'Enchant Item Permanent',
      'Enchant Item Temporary',
      'Tame Creature',
      'Summon Pet',
      'Learn Pet Spell',
      'Weapon Damage +',
      'Open Lock (Item)',
      'Proficiency',
      'Send Event',
      'Power Burn',
      'Threat',
      'Trigger Spell',
      'Health Funnel',
      'Power Funnel',
      'Heal Max Health',
      'Interrupt Cast',
      'Distract',
      'Pull',
      'Pickpocket',
      'Add Farsight',
      'Summon Possessed',
      'Summon Totem',
      'Heal Mechanical',
      'Summon Object (Wild)',
      'Script Effect',
      'Attack',
      'Sanctuary',
      'Add Combo Points',
      'Create House',
      'Bind Sight',
      'Duel',
      'Stuck',
      'Summon Player',
      'Activate Object',
      'Summon Totem (slot 1)',
      'Summon Totem (slot 2)',
      'Summon Totem (slot 3)',
      'Summon Totem (slot 4)',
      'Threat (All)',
      'Enchant Held Item',
      'Summon Phantasm',
      'Self Resurrect',
      'Skinning',
      'Charge',
      'Summon Critter',
      'Knock Back',
      'Disenchant',
      'Inebriate',
      'Feed Pet',
      'Dismiss Pet',
      'Reputation',
      'Summon Object (slot 1)',
      'Summon Object (slot 2)',
      'Summon Object (slot 3)',
      'Summon Object (slot 4)',
      'Dispel Mechanic',
      'Summon Dead Pet',
      'Destroy All Totems',
      'Durability Damage',
      'Summon Demon',
      'Resurrect (Flat)',
      'Attack Me',
      '',
      '',
      '',
      'Require Skill'
  ]

  BLIZZARD_TOKENS_REGEXP = /\$+(?:([\/,*])?(\d+);)?(\d+)?([A-z])([1-3]*)(([A-z, ]*):([A-z, ]*);)?/

  paginates_per 25

  self.table_name_prefix = 'wow_'

  belongs_to :icon, foreign_key: :spell_icon_id
  belongs_to :range
  belongs_to :cast_time, foreign_key: :spell_cast_time_id
  belongs_to :dispel_type
  belongs_to :duration
  belongs_to :mechanic

  default_scope { order('name_en ASC') }

  def name
    name_en
  end

  def rank
    rank_en
  end

  def tooltip
    if tooltip_en.blank? and !tooltip_original_en.blank?
      self.tooltip_en = replace_blizzard_tokens(tooltip_original_en)
      self.save
    end
    tooltip_en
  end

  def buff
    if buff_en.blank? and !buff_original_en.blank?
      self.buff_en = replace_blizzard_tokens(buff_original_en)
      self.save
    end
    buff_en
  end

  def school
    SCHOOLS[self[:resistance_id]]
  end

  def radius(i)
    radius_id = self.effect_radius(i)
    Wow::Spell::Radius.find(radius_id).base
  end

  def cooldown
    if (self[:cooldown] % 1000) > 0
      self[:cooldown]/1000.0
    else
      self[:cooldown]/1000
    end
  end

  def amplitude(i)
    if effect_amplitude(i) % 1000 > 0
      effect_amplitude(i) / 1000.0
    else
      effect_amplitude(i) / 1000
    end
  end

  def real_duration(i)
    duration.to_i / (effect_amplitude(i) > 0 ? effect_amplitude(i)/1000 : 5)
  end

  def effect_name(i)
    EFFECTS[i]
  end

  def aura_name(i)
    AURA_NAMES[i]
  end

  %w(id misc_value radius aura base_points item_type amplitude trigger_spell points_per_combo_point chain_target).each do |meth|
    define_method("effect_#{meth}") { |i| self["effect_#{i}_#{meth}".to_sym] }
  end

  def need_reagents?
    reagents_ids.any? {|id| id > 0 }
  end

  def reagents_ids
    [reagent_1, reagent_2, reagent_3, reagent_4, reagent_5, reagent_6, reagent_7, reagent_8]
  end

  def reagents(i)
    @reagents ||= Wow::Item.select(:id, :name, :quality, :display_id).where(id: reagents_ids).includes(:icon).all.to_a
    @reagents.find{ |item| item.id == reagents_ids[i-1] }
  end

  def reagent_counts(i)
    self["reagent_#{i}_count".to_sym]
  end

  def tools(i)
    @tools ||= Wow::Item.select(:id, :name, :quality, :display_id).where(id: [tool_1, tool_2]).includes(:icon).all.to_a
    @tools.find{ |item| item.id == self["tool_#{i}".to_sym] }
  end

  def need_tools?
    tool_1 > 0 || tool_2 > 0
  end

  def to_s
    name
  end

  def replace_blizzard_tokens(string)
    string.gsub(BLIZZARD_TOKENS_REGEXP) do
      i = $5.blank? ? 1 : $5.to_i
      token = $4.downcase
      spell = self
      spell = self.class.find($3) unless $3.blank?
      value = ''
      case token
        when 'z'
          return '[Home]'
        when 'l'
          count = spell.amplitude(i)
          value =  if (count == 1 || count =~ /^1(\.0+)?$/)
                     $7
                   else
                     $8
                   end
        when 'g'
          value = "[#{$6}]"
        when 'h'
          value = spell.proc_chance
        when 'u'
          return ''
        when 'v'
          value = spell.affected_target_level
        when 'q'
          value = spell.effect_misc_value(i)
        when 'i'
          value = (spell.targets > 0) ? spell.targets : 'nearby'
        when 'b'
          value = spell.effect_points_per_combo_point(i)
        when 'm', 's'
          value = spell.effect_base_points(i) + 1
        when 'a'
          value = spell.radius(i)
        when 'd'
          value = "#{spell.duration.to_i} sec"
        when 'o'
          value = spell.real_duration(i) * (spell.effect_base_points(i) + 1)
        when 't'
          value = spell.amplitude(i)
        when 'n'
          value = spell.proc_charges
        when 'x'
          value = spell.chain_target(i)
      end

      unless $2.blank?
        if $1 == '*'
          value = (value+1) * $2
        else
          value = (value+1) / $2
        end
      end
      value
    end
  end
end
