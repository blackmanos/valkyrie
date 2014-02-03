class Wow::Item < ActiveRecord::Base
  paginates_per 25

  self.table_name_prefix = 'wow_'
end
