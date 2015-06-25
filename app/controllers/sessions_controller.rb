class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @user.admin?
        redirect_to admin_user_path(@user)
      else
        redirect_to profile_path
      end
    else
      flash.now[:danger] = "Invalid login"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:danger] = "See you again soon!"
    redirect_to root_path
  end
end
