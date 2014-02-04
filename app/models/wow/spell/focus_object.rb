class Wow::Spell::FocusObject < ActiveRecord::Base
  self.table_name = "wow_spell_focus_objects"

  def name
    self["name_#{I18n.locale}".to_sym]
  end
end
