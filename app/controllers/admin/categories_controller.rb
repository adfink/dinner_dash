class Admin::CategoriesController < Admin::BaseController


  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    category = Category.new(category_params)
    if category.save
      redirect_to admin_user_path(current_user)
    else
      flash.now[:errors] = "oops that didn't persist to the database...as they say in the industry"
      redirect_to new_admin_category_path
    end
  end

  def update
    category = Category.find(params[:id])
    category.name = params[:name]
    redirect_to admin_user_path(current_user)
  end

  private

  def category_params
    params.require(:admin_category).permit(:name)
  end



end
