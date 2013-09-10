class Wow::SpellsController < ApplicationController

  def index
    @search = Wow::Spell.search params[:q]
    @spells = @search.result.includes(:icon).page(params[:page])
  end

  def show
    @spell = Wow::Spell.find params[:id]
  end
end
