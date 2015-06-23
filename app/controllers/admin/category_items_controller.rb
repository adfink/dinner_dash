class Admin::CategoryItemsController < Admin::BaseController

  def new
    @category = Category.find(params[:category_id])
    @items = Item.all
  end

  def new_category_to_item
    @categories = Category.all
    @item = Item.find(params[:item_id])
  end


  def create
    category_item = CategoryItem.new(category_item_params)
    if category_item.save
      redirect_to admin_user_path(current_user)
      # redirect_to admin_category_path(@category)
    else
      flash.now[:errors] = "oops that didn't persist to the database...as they say in the industry"
      redirect_to admin_user_path(current_user)
    end
  end


  # def update
  #   @category_item = CategoryItem.new(category_item_params)
  # end

  private

  def category_item_params
    params.permit(:item_id, :category_id)
  end
end
