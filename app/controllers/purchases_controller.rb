class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_drawing, only: [:new, :create]
  before_action :move_to_index, only: [:new, :create]

  def new
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, drawing_id: params[:drawing_id], token: params[:token])
  end

  def set_drawing
    @drawing = Drawing.find(params[:drawing_id])
  end

  def move_to_index
    if user_signed_in? && current_user.id == @drawing.user.id
      redirect_to root_path
    elsif Purchase.exists?(drawing_id: @drawing.id)
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @drawing.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
