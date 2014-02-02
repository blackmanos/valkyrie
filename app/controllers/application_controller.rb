class ApplicationController < ActionController::Base
  add_crumb "<span class=\"home-new-icon glyphicon glyphicon-home\"></span>#{I18n.t('home')}".html_safe, '/'

  protect_from_forgery
end
