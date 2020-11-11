class DrawingsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_drawing, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit]
  
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

  def show
  end

  def edit
  end

  def update
    if @drawing.update(drawing_params)
      redirect_to drawing_path(@drawing.id)
    else 
      render :edit
    end
  end

  def destroy
  end

  private

  def drawing_params
    params.require(:drawing).permit(:image, :title, :description, :production_date, :category_id, :genre_id, :price, :shipping_method_id, :height, :width).merge(user_id: current_user.id)
  end

  def set_drawing
    @drawing = Drawing.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current.user.id == @drawing.user.id
      redirect_to root_path
    end
  end
end
