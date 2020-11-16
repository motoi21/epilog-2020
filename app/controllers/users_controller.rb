class UsersController < ApplicationController
  def show
    @user = @user.find(params[:user_id])
  end
end
