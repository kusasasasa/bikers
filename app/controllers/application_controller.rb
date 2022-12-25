class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    private
    #sign_up時にエラーが発生しないようにするため、下記の値を許可する
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email, :age, :bike_type, :profile_image])
  
    end
end
