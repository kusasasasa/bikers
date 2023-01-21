class Public::FavoritesController < ApplicationController
    def index
        @favorite=current_end_user.favorites.page(params[:page]).reverse_order
        @posts=Post.all
        @end_users=EndUser.all
    end
    def create
        post = Post.find(params[:post_id])
        favorite = current_end_user.favorites.new(post_id: post.id)
        favorite.save
        redirect_to public_post_path(post)
    end
    def destroy
        post = Post.find(params[:post_id])
        favorite = current_end_user.favorites.find_by(post_id: post.id)
        favorite.destroy
        redirect_to public_post_path(post)
    end
    
end