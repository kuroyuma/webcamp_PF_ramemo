class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def update
  end

  def destroy
  end

  def post_params
    params.require(:post).permit(:image, :shop_name, :food_name, :genre, :price, :introduction, :prefecture, :user_id, )
  end
end
