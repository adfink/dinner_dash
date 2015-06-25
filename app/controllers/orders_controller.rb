class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
  end

  def new
    if current_user.nil?
      flash[:errors] = "please log in before you check out"
      redirect_to login_path
    end
  end

  def create
    order = current_user.orders.create
    @cart.items.each do |item, quantity|
      order.order_items.create(item_id: item.id, quantity: quantity)
    end
    @cart.clear
    session[:cart] = @cart.contents
    redirect_to profile_path
  end
end
