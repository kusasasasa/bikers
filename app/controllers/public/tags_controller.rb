class Public::TagsController < ApplicationController
    def show
        @tag=Tag.find(params[:id])
        @posts=Post.all
        @tags=Tag.all
        @end_users=EndUser.all
    end
    def index
        @tags=Tag.all.search(params[:search])
    end
end
