class DrawingsController < ApplicationController
  def index
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
    params.require(:drawing).permit(:image, :title, :description, :production_date, :category_id, :genre_id, :price, :shipping_method_id).merge(user_id: current_user.id)
  end
end
