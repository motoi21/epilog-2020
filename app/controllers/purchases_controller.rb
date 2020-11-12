class PurchasesController < ApplicationController
  def new
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new
    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path
    else
      render :new
    end
  end

end
