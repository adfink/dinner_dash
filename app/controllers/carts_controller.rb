class CartsController < ApplicationController
  def create
    # item = Item.find_by(id: params[:item_id])
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "#{@item.title} added to your cart"
    redirect_to :back
  end

  private

  def item
    @item = Item.find_by(id: params[:item_id])
  end
end
