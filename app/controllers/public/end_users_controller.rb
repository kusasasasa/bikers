class Public::EndUsersController < ApplicationController
    
    def index
            @end_user=current_end_user
            @posts=Post.all
            #年齢を取得し、1の位の値を切り捨てる
            @end_user_age=@end_user.age.truncate(-1)
            @tags=Tag.all
    end
    def show
        #ログイン中のユーザーの値を取得
        @end_user=current_end_user
        favorites = Favorite.where(end_user_id: current_end_user.id).pluck(:post_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
        @favorite_list = Post.find(favorites)
    end
    def edit
        @end_user=current_end_user
    end
    def update
        @end_user=EndUser.find(current_end_user.id)
        if @end_user.update(end_users_params)
            redirect_to public_end_user_path(@end_user.id)  
        else
         
            render:edit
        end
    end
    
    private
    def end_users_params
        params.require(:end_user).permit(:nickname, :age, :is_deleted, :bike_type, :email, :password, :profile_image)
    end
end
