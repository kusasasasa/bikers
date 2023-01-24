class Public::EndUsersController < ApplicationController
    before_action :authenticate_end_user!, except: [:index, :show]
    def index
            @end_user=current_end_user
            @posts=Post.all
            #年齢を取得し、1の位の値を切り捨てる
            @end_user_age=@end_user.age.truncate(-1)
            @tags=Tag.all
            @end_user_posts=Kaminari.paginate_array(@end_user.posts.reverse).page.page(params[:page])
            
            @num=0
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
            @end_user=current_end_user
            render:edit
        end
    end
    def withdrow
        @end_user=current_end_user
        # is_deletedカラムをtrueに変更することにより削除フラグを立てる
        @end_user.update(is_deleted: true)
        reset_session
        flash[:notice] = "退会処理を実行いたしました"
        redirect_to root_path
    end
    
    private
    def end_users_params
        params.require(:end_user).permit(:nickname, :age, :is_deleted, :bike_type, :email, :password, :profile_image)
    end
end
