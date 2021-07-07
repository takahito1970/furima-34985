class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :image, :description, :category_id, :status_id, :shipping_fee_id,
                                 :shipping_form_id, :day_ship_id, :price).merge(user_id: current_user.id)
  end
end
