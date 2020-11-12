class PurchasesController < ApplicationController
  def new
    @drawing = Drawing.find(params[:drawing_id])
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @drawing = Drawing.find(params[:drawing_id])
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, drawing_id: params[:drawing_id])
  end
end
