class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    # 上記はこの2行と同じcomment = PostComment.new(post_comment_params)
    # 　　　　　　　　　comment.user_id = current_user.id
    @comment.post_id = @post.id
    @comment.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    post_comment = @post.post_comments.find(params[:id])
    post_comment.destroy
    # PostComment.find_by(id: params[:id]).destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
