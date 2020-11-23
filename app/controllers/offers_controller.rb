class OffersController < ApplicationController
  def index
  end
  
  def new
    @offer = Offer.new
  end
end
