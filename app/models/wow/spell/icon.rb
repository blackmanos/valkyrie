class Wow::Spell::Icon < ActiveRecord::Base
  self.table_name = 'wow_spell_icons'

  def name
    self[:name].strip.downcase
  end
end
