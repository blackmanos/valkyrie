class Wow::SpellsController < ApplicationController
  before_action :add_crumbs

  def index
    @search = Wow::Spell.search params[:q]
    @spells = @search.result.includes(:icon).page(params[:page])
  end

  def show
    @spell = Wow::Spell.eager_load(:icon, :range, :cast_time, :dispel_type, :duration, :mechanic, :focus_object, skill_ability: (:skill) ).find params[:id]

    unless @spell.skill_ability.skill.nil?
      category_id = @spell.skill.category_id
      skill_id = @spell.skill.id
      case category_id
        when 7
          add_crumb I18n.t("wow.spell_categories.#{Wow::Skill::CATEGORIES[category_id]}"), category_wow_spells_path(category_id)
          c = @spell.skill_ability.class_id
          add_crumb I18n.t("wow.classes.#{Wow::Chars::Character::CLASSES[c]}"), class_wow_spells_path(category_id, c)
          add_crumb @spell.skill.name, class_skill_wow_spells_path(category_id, c, skill_id)
        when 6, 8, 9, 11
          add_crumb I18n.t("wow.spell_categories.#{Wow::Skill::CATEGORIES[category_id]}"), category_wow_spells_path(category_id)
          add_crumb @spell.skill.name, category_skill_wow_spells_path(category_id, skill_id)
      end
    end


    add_crumb @spell.name, @spell
  end

  def add_crumbs
    add_crumb(I18n.t('game'), root_path )
    add_crumb(I18n.t('wow.spells'), wow_spells_path)
  end
end
