class ApplicationController < ActionController::Base
  add_crumb "<span class=\"home-new-icon glyphicon glyphicon-home\"></span>#{I18n.t('home')}".html_safe, '/'
  include WowHelper

  before_action :set_locale

  protect_from_forgery

  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

# Get locale from top-level domain or return nil if such locale is not available
# You have to put something like:
#   127.0.0.1 application.com
#   127.0.0.1 application.it
#   127.0.0.1 application.pl
# in your /etc/hosts file to try this out locally
  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale  : nil
  end
end
