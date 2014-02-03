class Wow::Icon < ActiveRecord::Base

  self.table_name_prefix = 'wow_'

  def name
    self[:icon].strip.downcase
  end
end
