class Wow::Skill < ActiveRecord::Base
  CATEGORIES = [
      'not_used_0',
      'not_used_1',
      'not_used_2',
      'not_used_3',
      'not_user_4',
      'not_used_5',
      'weapons',
      'abilities',
      'armor',
      'secondary_skills',
      'languages',
      'professions',
      'generic_dnd'
  ]
  def name
    self["name_#{I18n.locale}".to_sym]
  end

  def profession?
    self.category_id == 11 || self.id.in?([185, 129, 356, 762])
  end
end
