class Wow::Spell < ActiveRecord::Base
  paginates_per 25

  self.table_name_prefix = 'wow_'

  belongs_to :icon, foreign_key: :spell_icon_id

  default_scope { order('name_en ASC') }

  def name
    name_en
  end

  def rank
    rank_en
  end
end
