class Admin::UsersController < Admin::BaseController
  def show
    @categories = Category.all
  end
end
