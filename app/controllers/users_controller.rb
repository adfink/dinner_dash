class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_path
    else
      flash.now[:errors] = @user.errors.full_messages.join(", ")
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :full_name, :display_name, :password)
  end

end
