class Wow::SpellsController < ApplicationController
  before_action :add_crumbs

  def index
    search_params = params[:q] || {}
    if params.has_key?(:category_id)
      category_id = params[:category_id].to_i
      search_params[:skill_category_id_eq] = category_id
      add_crumb I18n.t("wow.spell_categories.#{Wow::Skill::CATEGORIES[category_id]}"), category_wow_spells_path(category_id)

      if params.has_key?(:class_id) && category_id == 7
        c = params[:class_id].to_i
        search_params[:skill_ability_class_mask_eq] = 2 ** (c-1)
        add_crumb I18n.t("wow.classes.#{Wow::Chars::Character::CLASSES[c]}"), class_wow_spells_path(category_id, c)
      end

      if params.has_key?(:skill_id)
        skill_id = params[:skill_id].to_i
        skill = Wow::Skill.find(skill_id)
        if params.has_key?(:class_id) && category_id == 7
          add_crumb skill.name, class_skill_wow_spells_path(category_id, c, skill_id)
        else
          add_crumb skill.name, category_skill_wow_spells_path(category_id, skill_id)
        end
        search_params[:skill_id_eq] = skill_id
      end
    end

    @search = Wow::Spell.search search_params
    @spells = @search.result(distinct: true).includes(:icon).page(params[:page])
  end

  def show
    @spell = Wow::Spell.eager_load(:icon, :range, :cast_time, :dispel_type, :duration, :mechanic, :focus_object, skill_ability: (:skill) ).find params[:id]

    unless  @spell.skill_ability.nil?
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
    end
    add_crumb @spell.name, @spell
  end

  def add_crumbs
    add_crumb(I18n.t('game'), root_path )
    add_crumb(I18n.t('wow.spells'), wow_spells_path)
  end
end
