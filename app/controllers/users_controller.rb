class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user  ##他人のプロフィールを編集できないように
      render "edit"
    else
      redirect_to posts_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def user_params
    params.require(:user).permit(:profile_image, :name, :recommend, :amount_eaten, :self_introduction, )
  end
end
