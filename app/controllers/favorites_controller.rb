class FavoritesController < ApplicationController
  before_action :require_user_logged_in
 
 
  def create
    micropost = Micropost.find(params[:micropost_id])
      current_user.like(micropost)
      flash[:success] = 'お気に入りに追加しました'
      redirect_to root_path
  end

  def destroy
    # binding.pry
    micropost = current_user.feed_like_microposts.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = 'お気に入りを外しました'
    redirect_to root_path
  end
end