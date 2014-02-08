class Wow::Spell < ActiveRecord::Base
  SCHOOLS = %w(physical holy fire nature frost shadow arcane)

  self.table_name = 'wow_spells'

  BLIZZARD_TOKENS_REGEXP = /\$(?:(\d+)?([\/*])(\d+);)?(\d+)?([A-z])([1-3]?)(([^ ].*?):(.*?);)?/

  paginates_per 25

  belongs_to :icon
  belongs_to :range
  belongs_to :cast_time
  belongs_to :dispel_type
  belongs_to :duration
  belongs_to :mechanic
  belongs_to :focus_object

  has_many :trainers, class_name: 'Wow::Npc::Trainer'
  has_one  :skill_ability, -> { eager_load :skill }
  delegate :skill, to: :skill_ability, allow_nil: true

  has_many :effects, inverse_of: :spell
  has_many :reagents, -> { eager_load(item: (:icon)) }
  has_and_belongs_to_many :tools, join_table: :wow_spells_tools, class_name: 'Wow::Item'
  has_many :created_items, -> { where(wow_spell_effects: {type: 24}) }, through: :effects, source: :item
  has_many :triggered_spells, -> { where(wow_spell_effects: {type: 64}) }, through: :effects, source: :triggered_spell
  has_one :taught_by_effect, -> { where(type: 36).eager_load(:spell) }, foreign_key: :triggered_spell_id, class_name: 'Wow::Spell::Effect'

  delegate :spell, to: :taught_by_effect, prefix: :taught_by, allow_nil: true

  def name
    self["name_#{I18n.locale}".to_sym]
  end

  def rank
    self["rank_#{I18n.locale}".to_sym]
  end

  def tooltip
    if self["tooltip_#{I18n.locale}".to_sym].blank? and !self["tooltip_original_#{I18n.locale}".to_sym].blank?
      self["tooltip_#{I18n.locale}".to_sym] = replace_blizzard_tokens(self["tooltip_original_#{I18n.locale}".to_sym], 'tooltip')
      self.save
    end
    self["tooltip_#{I18n.locale}".to_sym]
  end

  def buff
    if self["buff_#{I18n.locale}".to_sym].blank? and !self["buff_original_#{I18n.locale}".to_sym].blank?
      self["buff_#{I18n.locale}".to_sym] = replace_blizzard_tokens(self["buff_original_#{I18n.locale}".to_sym], 'buff')
      self.save
    end
    self["buff_#{I18n.locale}".to_sym]
  end

  def school
    SCHOOLS[self[:resistance_id]]
  end

  def cooldown
    if (self[:cooldown] % 1000) > 0
      self[:cooldown]/1000.0
    else
      self[:cooldown]/1000
    end
  end

  def real_duration(i)
    duration.to_i / (effect(i).amplitude? ? effect(i).amplitude : 5)
  end

  def icon_name
    if self.effects.to_a.any? { |e| e.type == 24}
      self.created_items.first.icon_name
    else
      self.icon.name
    end
  end

  def to_s
    name
  end

  def effect(i)
    self.effects.to_a.find { |e| e.number == i }
  end

  def replace_blizzard_tokens(string, to_replace)
    string.gsub(BLIZZARD_TOKENS_REGEXP) do
      i = $6.blank? ? 1 : $6.to_i
      token = $5.downcase
      spell = self
      spell = self.class.find($4) unless $4.blank?
      spell = self.class.find($1) unless $1.blank?
      if !self.effect(i).nil? && self.effect(i).type == 64 && $1.blank? && to_replace == 'buff' && self.effect(i).trigger_id != spell.id
        spell = self.class.find(self.effect(i).trigger_id)
      end
      effect = spell.effect(i)
      value = case token
        when 'z'
          '[Home]'
        when 'l'
          count = effect.base_points
          (count == 1 || count =~ /^1(\.0+)?$/) ? $8 : $9
        when 'g'
          "[#{$7}]"
        when 'h'
          spell.proc_chance
        when 'u'
          ''
        when 'v'
          spell.affected_target_level
        when 'q'
          effect.misc_value
        when 'i'
          (spell.targets > 0) ? spell.targets : I18n.t(:nearby)
        when 'b'
          effect.points_per_combo_point
        when 'm', 's'
          (effect.base_points + 1).abs
        when 'a'
          effect.radius.base
        when 'd'
          "#{spell.duration.to_i} #{I18n.t(:sec)}"
        when 'o'
          spell.real_duration(i) * (effect.base_points + 1)
        when 't'
          effect.amplitude
        when 'n'
          spell.proc_charges
        when 'x'
          effect.chain_target
      end

      unless $3.blank?
        if $2 == '*'
          value = (value+1) * $3.to_i
        else
          value = (value+1) / $3.to_i
        end
      end
      value
    end
  end
end
