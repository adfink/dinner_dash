class ItemsController < ApplicationController
  def show
    @item = Item.find_by(id: params[:id])
  end

  def index
    @items = Item.search(params[:search])
  end
end
