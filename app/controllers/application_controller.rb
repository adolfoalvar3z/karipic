class ApplicationController < ActionController::Base

#app/controllers/application_controller.rb
before_action :configure_permitted_parameters, if: :devise_controller?
protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :avatar, :role])
        devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :avatar, :role])
    end
    def after_sign_in_path_for(resource)
        root_path # esta es la ruta donde redireccionaremos en caso de
    end

#app/controllers/application_controller.rb
#con esto validaremos que el usuario cumple con el rol para realizar acciones
	def authorize_request(kind = nil)
	 unless kind.include?(current_user.role)
		 redirect_to posts_path, notice: "Tu no tienes privilegios para realizar estas acciones"
		end
	end

end
