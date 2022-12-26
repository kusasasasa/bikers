class Public::PostsController < ApplicationController
    def new
        @post=Post.new
        @end_user=current_end_user
    end
    
    def index
        @posts=Post.all
        @end_users=EndUser.all
    end
    
    def show
        @post=Post.find(params[:id])
        @end_users=EndUser.all
        @age=@post.end_user.age.truncate(-1)
    end
    
    def create
        @post= Post.new(post_params)
        @post.end_user_id=current_end_user.id
        if @post.save
    # 4. トップ画面へリダイレクト
           
            redirect_to public_end_users_path
        else
            render :new
        end
    end
    
    def edit
        @post=Post.find(params[:id])
    end
    
    def update
        @post=Post.find(params[:id])
        if @post.update(post_params)
            redirect_to public_post_path(@post.id)  
        else
            render :edit
        end
    end
    
    private
    def post_params
        params.require(:post).permit(:end_user_id, :destination, :body, :img_url, :address, img_urls: [])
    end
end
