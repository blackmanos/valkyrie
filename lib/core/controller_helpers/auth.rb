module Core
  module ControllerHelpers
    module Auth
      extend ActiveSupport::Concern

      included do
        rescue_from CanCan::AccessDenied do |exception|
          redirect_to root_url, alert: exception.message
        end
      end

      def rescue_admin_access_denied(exception)
        error_message = exception.message

        respond_to do |format|
          format.html do
            flash.alert = error_message

            if cannot? :read, ActiveAdmin::Page, name: 'Dashboard'
              redirect_to root_url
            elsif request.headers.keys.include?('HTTP_REFERER')
              redirect_to :back
            else
              controller, action = active_admin_namespace.root_to.split('#')
              redirect_to controller: controller, action: action
            end
          end

          format.csv { render text: error_message, status: :unauthorized }
          format.json { render json: { error: error_message }, status: :unauthorized }
          format.xml { render xml: "<error>#{error_message}</error>", status: :unauthorized }
        end
      end
    end
  end
end