class CartItemsController < ApplicationController
  def create
    item = Item.find_by(id: params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "#{item.title} added to your cart"
    redirect_to :back
  end

  def update
    @cart.contents[params[:item_id]] = params[:quantity]
    session[:cart] = @cart.contents
    flash[:notice] = "your cart has been updated"
    redirect_to new_order_path
  end 
end
