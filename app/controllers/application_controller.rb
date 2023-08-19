class ApplicationController < ActionController::Base

    protected
    
    #def configure_permitted_parameters
    #    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    #end

    def authorize_request(kind = nil)
        unless kind.include?(current_trn_user.role)
            redirect_to trn_news_path, notice: "No estás autorizado"
        end
    end

    def after_sign_in_path_for(resource)
        trn_news_path
    end
end
