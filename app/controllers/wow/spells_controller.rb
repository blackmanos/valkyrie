class Wow::SpellsController < ApplicationController
  before_action :add_crumbs

  def index
    @search = Wow::Spell.search params[:q]
    @spells = @search.result.includes(:spell_icon).page(params[:page])
  end

  def show
    @spell = Wow::Spell.eager_load(:spell_icon, :range, :cast_time, :dispel_type, :duration, :mechanic, :focus_object).find params[:id]

    add_crumb @spell.name, @spell
  end

  def add_crumbs
    add_crumb(I18n.t('game'), root_path )
    add_crumb(I18n.t('wow.spells'), wow_spells_path)
  end
end
