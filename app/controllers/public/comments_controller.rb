class Public::CommentsController < ApplicationController
    def create
        post = Post.find(params[:post_id])
        comment = current_end_user.comments.new(comment_params)
        comment.post_id = post.id
        comment.end_user_id = current_end_user.id
        comment.save
        redirect_to public_post_path(post)
    end
    
    def destroy
        Comment.find(params[:id]).destroy
        redirect_to public_post_path(params[:post_id])
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:body, :post_id, :end_user_id)
    end

end
