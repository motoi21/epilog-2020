class OffersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def new
    @offer = Offer.new
  end
end
