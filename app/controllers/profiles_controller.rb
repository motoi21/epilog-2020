class ProfilesController < ApplicationController
  def edit
    @user = User.find(params[:id])
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def update
    @user = User.find(params[:id])
    @profile = Profile.find_by(user_id: current_user.id)
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
end
