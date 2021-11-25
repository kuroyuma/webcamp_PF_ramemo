class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
    pp @posts #投稿確認のため記載
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user  #他人の投稿を編集できないように
      render "edit"
    else
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def search
    @posts = Post.search(params[:prefecture])
    render "index"
  end

  def post_params
    params.require(:post).permit(:image, :shop_name, :food_name, :genre, :price, :introduction, :prefecture, :user_id, :evaluation )
  end
end
