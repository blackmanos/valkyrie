class Wow::StatisticController < Wow::CharsController
  def current
    search = {'meta_sort' => 'honor_static_thisWeek_cp.desc'}.merge(params[:search] || {})
    @search = Wow::Chars::Character.pvp_current.search(search)
    @characters = @search.page(params[:page])
    render 'pvp'
  end
end
