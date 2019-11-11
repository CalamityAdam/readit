class CommentsController < ApplicationController
  before_action :set_comment, only: [:upvote, :downvote]
  
  def create
    puts '--------------------'
    @comment = Comment.new(comment_params)
    @comment.post_id = post_id_params
    if (@comment.save) 
      redirect_to post_path(post_id_params)
    else 
      # ! do something
    end
  end
  
  def upvote
    @comment.votes += 1
    if (@comment.valid?)
      @comment.save
      redirect_to post_path(@post)
    end
  end
  
  def downvote
    @comment.votes -= 1
    if (@comment.save)
      redirect_to post_path(@post)
    end
  end
  
  private 
  # strong params
  def comment_params
    params.require(:comment).permit(:body)
  end
  
  def post_id_params
    params[:post_id]
  end
  
  def set_comment
    @comment = Comment.find(params[:comment_id])
    @post = Post.find(params[:post_id])
  end
end
