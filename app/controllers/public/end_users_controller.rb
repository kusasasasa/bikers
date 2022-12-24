class Public::EndUsersController < ApplicationController
    def index
    end
    def show
    end
    def edit
    end
    private
    def end_users_params
        params.require(:end_user).permit(:nickname, :profile_img, :age, :is_deleted, :bike_type)
    end
end
