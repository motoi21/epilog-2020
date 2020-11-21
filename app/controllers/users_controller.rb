class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :move_to_show, only: [:edit, :update]

  
  def show
  end

  def edit
  end
    
  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
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

  def move_to_show
    unless user_signed_in? && current_user.id == @user.id
      redirect_to user_path(@user.id)
    end
  end
end
