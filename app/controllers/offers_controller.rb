class OffersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @offers = Offer.where(creater_id: @user.id)
    @profile = Profile.find_by(user_id: @user.id)
  end

  def new
    @user = User.find(params[:user_id])
    @offer = Offer.new
  end

  def create
    @user = User.find(params[:user_id])
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to user_offers_path(@user.id)
    else
      render :new
    end
  end

  private
  def offer_params
  params.require(:offer).permit(:budget, :order_name, :category_id, :genre_id, :detail, :deadline, :height, :width, :shipping_method_id, :creater_id).merge(user_id: current_user.id)
  end
end
