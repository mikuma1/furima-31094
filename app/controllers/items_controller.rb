class ItemsController < ApplicationController
  def index
  end

  def new
    @categories = Category.all
  end

  def create
  end

  def edit
  end

  def show
  end

  private
  def item_params
    params.reguire(:item).permit(:name, :info, :category, :sales_status, :shopping_fee_status, :prefecture, :scheduled_delivery, :price).merge(:user current_user_id)
  end
end
