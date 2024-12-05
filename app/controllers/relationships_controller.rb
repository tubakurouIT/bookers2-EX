class RelationshipsController < ApplicationController
  before_action :authenticate_user!

#フォローする時
  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to request.referer
  end

#フォローを外す時
  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to request.referer
  end


  #フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end


#フォロワー一覧
   def followers
    user = User.find(params[:user_id])
    @users = user.followers
   end



end
