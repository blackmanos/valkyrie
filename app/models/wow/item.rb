class Wow::Item < ActiveRecord::Base
  paginates_per 25

  self.table_name_prefix = 'wow_'

  belongs_to :icon, foreign_key: :display_id

  delegate :name, to: :icon, prefix: true

  def to_s
    name
  end
end