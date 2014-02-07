class Wow::Skill < ActiveRecord::Base
  def name
    self["name_#{I18n.locale}".to_sym]
  end

  def profession?
    self.category_id == 11 || self.id.in?([185, 129, 356, 762])
  end
end
