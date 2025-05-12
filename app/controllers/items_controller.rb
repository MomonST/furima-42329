class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @item = Item.new
    @items = Item.order("created_at DESC").includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
     redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :delivery_time_id, :item_price, :user).merge(user_id: current_user.id)
  end
  # def move_to_index
  # return if user_signed_in?
  # redirect_to action: :index
  # end
end
