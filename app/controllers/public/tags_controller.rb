class Public::TagsController < ApplicationController
    def index
        @tags=Tag.page(params[:page]).reverse_order
    end
    def show
        @tag=Tag.find(params[:id])
        @posts=Post.all
        @tags=Tag.all
        @end_users=EndUser.all
        @num=0
        @tagpost=@tag.posts.page(params[:page])
    end
    def search
        @tags=Tag.all.search(params[:search]).page(params[:page])
    end
end
