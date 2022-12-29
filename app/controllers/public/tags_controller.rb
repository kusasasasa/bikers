class Public::TagsController < ApplicationController
    def show
        @tag=Tag.find(params[:id])
        @posts=Post.all
        @tags=Tag.all
    end
end
