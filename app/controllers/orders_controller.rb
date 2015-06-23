class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
  end

  def new
  end

  def create
    if current_user
      order = current_user.orders.create
      @cart.items.each do |item, quantity|
        order.order_items.create(item_id: item.id, quantity: quantity)
      end
      @cart.clear
      session[:cart] = @cart.contents
      redirect_to profile_path
    else
      flash[:notice] = "please log in before you check out"
      redirect_to login_path
    end
  end
end
