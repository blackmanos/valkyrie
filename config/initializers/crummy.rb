Crummy.configure do |config|
  config.format = :html_list
  config.microdata = true

  config.ul_class = 'breadcrumb'
  config.last_class = 'active'
  config.last_crumb_linked = false
  config.html_list_separator = '<span class="divider glyphicon glyphicon-chevron-right"></span>'.html_safe
end