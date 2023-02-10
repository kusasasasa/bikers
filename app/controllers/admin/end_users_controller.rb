class Admin::EndUsersController < ApplicationController
    before_action :authenticate_admin!
    def index
        @end_users=EndUser.page(params[:page]).reverse_order
    end
    
    def show
        @end_user=EndUser.find(params[:id])
    end
    
    def edit
        @end_user=EndUser.find(params[:id])
    end
    
    def update
        end_user=EndUser.find(params[:id])
        if end_user.update(end_user_params)
            redirect_to admin_end_user_path(end_user.id) 
        else
            
            render :new
        end
    end
    private
    def end_user_params
        params.require(:end_user).permit(:nickname, :email, :is_deleted, :age, :bike_type)
    end
end
