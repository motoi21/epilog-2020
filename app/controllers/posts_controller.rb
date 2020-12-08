class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @profile = Profile.find_by(user_id: @user.id)
  end
end
