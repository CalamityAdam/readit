class PostsController < ApplicationController
  before_action :set_posts, only: [:index]
  before_action :set_post, only: [:upvote, :downvote]
  
  def index
  end
  
  def show
    puts '----------------'
    puts @params
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.create(post_params)
    redirect_to post_path(@post)
  end
  
  def upvote
    @post.votes += 1
    if (@post.valid?)
      @post.save
      redirect_to posts_path
    else
      puts 'got here'
      # do ! something
    end
    
  end
  
  def downvote
    @post.votes -= 1
    if (@post.valid?)
      @post.save
      redirect_to posts_path
    end
  end
  private
  # strong params
  def post_params
    params.require(:post).permit(:title, :body)
  end
  
  def set_posts
    @posts = Post.all
  end
  
  def set_post
    puts '----------------------'
    puts params
    @post = Post.find(params[:post_id])
  end
end
