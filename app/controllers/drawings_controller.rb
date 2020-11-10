class DrawingsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @drawings_with_price = Drawing.where.not(price: nil)
    @drawings_analog = Drawing.where(category_id: 3)
    @drawings_illustration = Drawing.where(genre_id: 2)
    @drawings_manga = Drawing.where(genre_id: 3)
    @drawings_portrait = Drawing.where(genre_id: 9)
    @drawings_poster = Drawing.where(genre_id: 4)
  end

  def new
    @drawing = Drawing.new
  end

  def create
    @drawing = Drawing.new(drawing_params)
    if @drawing.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def drawing_params
    params.require(:drawing).permit(:image, :title, :description, :production_date, :category_id, :genre_id, :price, :shipping_method_id, :height, :width).merge(user_id: current_user.id)
  end
end
