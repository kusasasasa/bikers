class Public::PostsController < ApplicationController
    before_action :authenticate_end_user!, except: [:index, :show]
    def new
        @post=Post.new
        @end_user=current_end_user
        @tags=Tag.all
        @num=0
    end
    
    def index
        
        @tags = Tag.all
        #@posts_search=Post.all.search(params[:search])
        @posts=Post.all.search(params[:search]).page(params[:page]).reverse_order
        #@posts=Kaminari.paginate_array(Post.all.reverse).page.page(params[:page])
        @end_users=EndUser.all
        @num=0
    end
    
    def show
        @post=Post.find(params[:id])
        @posts = Post.page(params[:page])
        @end_users=EndUser.all
        @age=@post.end_user.age.truncate(-1)
        @post_tags = @post.tags
        @tags=Tag.all
        @comment =Comment.new
        @comments=@post.comments.page(params[:page]).reverse_order
        @num=0
    end
    
    def search
        @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
        @post = params[:id]  #クリックしたタグを取得
        
    end
    
    
    def create
        @post= Post.new(post_params)
        @post.end_user_id=current_end_user.id
        @tags=Tag.all
        tag_list = params[:post][:name].split(nil)
        tag_list=tag_list.uniq
        if @post.save
    # 4. トップ画面へリダイレクト
            @post.save_tag(tag_list)  
            redirect_to public_end_users_path
        else
            @post= Post.new(post_params)
            @num=0
            render :new
        end
    end
    
    def edit
        @post=Post.find(params[:id])
        @tag_list=@post.tags.pluck(:name).join(" ")
    end
  
    def update
        @post=Post.find(params[:id])
        tag_list=params[:post][:name].split(nil)
        tag_list=tag_list.uniq
        if @post.update(post_params)
        # わからん
            @old_relations=PostTagDetail.where(post_id: @post)
            @old_relations.each do |relation|
                relation.delete
            end 
            @post.save_tag(tag_list)
            redirect_to public_post_path(@post.id)
        else 
            render :edit
        end
    end
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to public_end_users_path
    end
    
    def favorite
      @posts=Post.all
    end
    private
    def post_params
        params.require(:post).permit(:end_user_id, :destination, :body, :img_url, :address, img_urls: [])
    end
    
    
end
