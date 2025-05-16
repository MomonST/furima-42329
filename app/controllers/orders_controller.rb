class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_shipping_address = OrderShippingAddress.new

  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?   
      @order_shipping_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_shipping_address).permit( :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user: current_user, item: @item)
  end

end
