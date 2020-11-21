class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def show
  end

  def edit
  end
    
  def update
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else 
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
