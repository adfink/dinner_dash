class CartItemsController < ApplicationController
  def create
    item = Item.find_by(id: params[:item_id])
    @cart.add_item(item.id)
    set_cart
    flash[:notice] = "#{item.title} added to your cart"
    redirect_to :back
  end

  def update
    if params[:quantity].to_i > 0
      @cart.contents[params[:item_id]] = params[:quantity]
    else
      @cart.contents.delete(params[:item_id])
    end
    set_cart
    flash[:notice] = "your cart has been updated"
    redirect_to new_order_path
  end 

  private

  def set_cart
    session[:cart] = @cart.contents
  end
end
