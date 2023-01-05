class Public::CommentsController < ApplicationController
    def create
        post = Post.find(params[:post_id])
        comment = current_end_user.posts.new(post_params)
        comment.post_id = post.id
        comment.save
        redirect_to public_post_path(post)
    end
    
    private
    
    def post_params
        params.require(:post).permit(:body)
    end

end
