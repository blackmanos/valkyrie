class ApplicationController < ActionController::Base
  include Core::ControllerHelpers::Auth

  protect_from_forgery
end
