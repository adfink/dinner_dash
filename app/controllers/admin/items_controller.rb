class Admin::ItemsController < Admin::BaseController
before_action(:set_item, only: [:edit, :show, :update])

  def index
    @items = Item.all
  end

  def new
    @categories = Category.all
    @item = Item.new
  end

  def edit
    @categories = Category.all
  end

  def show
  end

  def update
    @item.update(item_params)
    @item.set_categories(params[:category][:ids])
    flash[:notice] = "Neato!!!...#{@item.title} was just updated in our postgres database"
    redirect_to admin_items_path
  end

  def update_status
    item = Item.find_by(id: params[:id])
    item.update_attributes(status: params[:status])
    redirect_to :back
  end

  def create
    item = Item.new(item_params)
    if params[:category] && item.save
      item.set_categories(params[:category][:ids])
      redirect_to admin_items_path
    else
      flash[:errors] = "invalid item parameters"
      redirect_to new_admin_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image)
  end

  def set_item
    @item = Item.find_by(id: params[:id])
  end
end
