module ApplicationHelper
  def debug(object)
    html = ''
    if Rails.env == 'development'
      html << content_tag(:h3, I18n.t(:debug_info), {'data-toggle' => 'collapse', 'data-target' => '#debug_dump', 'style' => 'cursor: pointer'})
      Marshal::dump(object)
      object = ERB::Util.html_escape(object.to_yaml).gsub('  ', "&nbsp; ").html_safe
      html << content_tag(:pre, object, id: 'debug_dump', class: 'pre-scrollable collapse in debug_dump')
    end
    html.html_safe
  rescue Exception
    content_tag(:code, object.inspect, id: 'debug_dump', class: 'pre-scrollable collapse in debug_dump')
  end
end
