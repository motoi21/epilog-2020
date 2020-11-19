class ProfilesController < ApplicationController
  def edit
    @profile.find(params[:profile_id])
  end

  def update
    @profile.find(params[:profile_id])
    if @profile.update(profile_params)
      redirect_to redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:introduction, :category_id, :genre_id).merge(user_id: current_user.id)
  end
end
