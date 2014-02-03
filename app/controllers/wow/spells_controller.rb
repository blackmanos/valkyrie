class Wow::SpellsController < ApplicationController
  add_crumb(I18n.t('game')) { |instance| instance.send :root_path }
  add_crumb(I18n.t('wow.spells')) { |instance| instance.send :game_spells_path }

  def index
    @search = Wow::Spell.search params[:q]
    @spells = @search.result.includes(:icon).page(params[:page])
  end

  def show
    @spell = Wow::Spell.unscoped.eager_load(:icon, :range, :cast_time, :dispel_type, :duration, :mechanic).find params[:id]

    add_crumb @spell.name, @spell
  end
end
