class Admin::PostsController < ApplicationController
    def index
        @posts=Post.page(params[:page])
        @end_users=EndUser.all
    end
    def show
        @post=Post.find(params[:id])
        @posts = Post.page(params[:page]).per(10)
        @end_users=EndUser.all
        @age=@post.end_user.age.truncate(-1)
        @post_tags = @post.tags
        @tags=Tag.all
        @comment =Comment.new
        @comments=@post.comments
    end
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to admin_posts_path
    end
    private
    def post_params
        params.require(:post).permit(:end_user_id, :destination, :body, :img_url, :address, img_urls: [])
    end
end
