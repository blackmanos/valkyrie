class Wow::Spell::Range < ActiveRecord::Base
  self.table_name = 'wow_spell_ranges'

  def max
    self[:range_max]
  end
end
