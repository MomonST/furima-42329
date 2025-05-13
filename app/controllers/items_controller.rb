class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update] 
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.all.order("created_at DESC").includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
     redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show  
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :delivery_time_id, :item_price, :user).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def move_to_index
    if current_user != @item.user   #@item.order.present?は後でつける
      redirect_to root_path
    end
  end
end
