class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: params[:post_id])
    favorite.save
    # redirect_to post_path(post)
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: params[:post_id])
    favorite.destroy
    # redirect_to post_path(post)
    # redirect_back(fallback_location: root_path)
  end
end
