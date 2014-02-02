class Wow::Spell::Duration < ActiveRecord::Base
  self.table_name = 'wow_spell_durations'

  def to_i
    if (self[:base] % 1000) > 0
      self[:base]/1000.0
    else
      self[:base]/1000
    end
  end
end
