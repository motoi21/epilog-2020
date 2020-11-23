class OffersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @offer = Offer.new
  end

  def create
    @user = User.find(params[:user_id])
    @offer = Offer.new
    if @order.save
      redirect_to user_offers_path(@user.id)
    else
      render :new
    end
  end
end
