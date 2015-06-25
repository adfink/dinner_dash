class Admin::UsersController < Admin::BaseController
  def show
    @categories = Category.all
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:success] = "you have updated your profile"
      redirect_to admin_user_path(@user)
    else
      flash.now[:danger] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :display_name, :email)
  end
end
