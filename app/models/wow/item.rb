class Wow::Item < ActiveRecord::Base
  paginates_per 25

  self.table_name_prefix = 'wow_'

  belongs_to :item_icon, foreign_key: :display_id, class: Wow::Icon

  def to_s
    name
  end

  def icon
    self.item_icon.name
  end
end