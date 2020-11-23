class OffersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @offer = Offer.new
  end
end
