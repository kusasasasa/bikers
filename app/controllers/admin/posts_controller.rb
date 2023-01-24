class Admin::PostsController < ApplicationController
    before_action :authenticate_admin!
    def index
        @posts=Post.page(params[:page]).reverse_order
        @end_users=EndUser.all
    end
    def show
        @post=Post.find(params[:id])
        @end_users=EndUser.all
        @age=@post.end_user.age.truncate(-1)
        @post_tags = @post.tags
        @tags=Tag.all
        @comment =Comment.new
        @comments=@post.comments.page(params[:page]).reverse_order
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
