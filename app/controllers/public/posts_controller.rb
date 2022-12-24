class Public::PostsController < ApplicationController
    def new
        @post=Post.new(post_params)
    end
    def index
    end
    private
    def post_params
        params.require(:post).permit(:end_user_id, :destination, :body, :img_url, :address)
    end
end
