class Admin::TagsController < ApplicationController
    def index
        @tags=Tag.all
    end
    def show
        @tag=Tag.find(params[:id])
        @posts=Post.all
    end
    def destroy
        Tag.find(params[:id]).destroy
        redirect_to admin_tags_path
    end
end
