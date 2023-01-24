class Admin::TagsController < ApplicationController
    before_action :authenticate_admin!
    def index
        @tags=Tag.page(params[:page]).reverse_order
    end
    def show
        @tag=Tag.find(params[:id])
        @posts=Post.all
        @tagpost=@tag.posts.page(params[:page])
    end
    def search
        @tags=Tag.all.search(params[:search]).page(params[:page])
        #ページネイションが設定できていないので質問する
        
    end
    def destroy
        Tag.find(params[:id]).destroy
        redirect_to admin_tags_path
    end
end
