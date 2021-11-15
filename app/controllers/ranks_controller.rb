class RanksController < ApplicationController

  def favorite
    @post_favorite_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id))
  end

  def ate
     @user_ate_ranks = User.find(Post.group(:user_id).order('count(user_id) desc').pluck(:user_id))
  end

end
