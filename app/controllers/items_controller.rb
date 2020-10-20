class ItemsController < ApplicationController
  def index
    @items = Item.order("creeated_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  private
  def item_params
    params.reguire(:item).permit(:name, :info, :category, :sales_status, :shopping_fee_status, :prefecture, :scheduled_delivery, :price).merge(user: current_user_id)
  end
end
