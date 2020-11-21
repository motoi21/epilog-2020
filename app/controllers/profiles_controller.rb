class ProfilesController < ApplicationController
  before_action :authenticate_user!, only:[:edit, :update]
  before_action :set_user_profile, only:[:edit, :update]
  before_action :move_to_show, only: [:edit, :update]
  
  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:introduction, :category_id, :genre_id).merge(user_id: current_user.id)
  end

  def set_user_profile
    @user = User.find(params[:id])
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def move_to_show
    unless user_signed_in? && current_user.profile.id == @user.profile.id
      redirect_to user_path(@user.id)
    end
  end

end
