class Admin::ItemsController < Admin::BaseController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    flash[:notice] = "Neato!!!...#{item.title} was just updated in our postgres database"
    redirect_to admin_items_path
  end

  def create
      item = Item.new(item_params)
      if item.save
        redirect_to admin_items_path
      else
        flash.now[:errors] = "oops that didn't persist to the database...as they say in the industry"
        redirect_to new_admin_item_path
      end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :photo_url)
  end

end
