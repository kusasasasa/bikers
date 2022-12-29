class Public::PostsController < ApplicationController
    def new
        @post=Post.new
        @end_user=current_end_user
        @tags=Tag.all
    end
    
    def index
        
        @tag_list = Tag.all
        @posts=Post.all
        @end_users=EndUser.all
    end
    
    def show
        @post=Post.find(params[:id])
        @posts = Post.page(params[:page]).per(10)
        @end_users=EndUser.all
        @age=@post.end_user.age.truncate(-1)
        @post_tags = @post.tags
        @tags=Tag.all
        
    end
    
    def search
        @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
        @post = params[:id]  #クリックしたタグを取得
        
    end
    
    
    def create
        @post= Post.new(post_params)
        @post.end_user_id=current_end_user.id
        tag_list = params[:post][:name].split(nil) 
        if @post.save
    # 4. トップ画面へリダイレクト
            @post.save_tag(tag_list)  
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
