class Admin::CategoriesController < Admin::BaseController
before_action(:set_category, only: [:show, :edit, :update])

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
  end

  def edit
  end

  def create
    category = Category.new(category_params)
    if category.save
      redirect_to admin_categories_path
    else
      flash[:errors] = "oops that didn't persist to the database...as they say in the industry"
      redirect_to new_admin_category_path
    end
  end

  def update
    @category.update(category_params)
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find_by(id: params[:id])
  end
end
