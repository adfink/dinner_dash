class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      # redirect_to admin_user_path(@user) if @user.admin?
      # redirect_to :back
      # binding.pry
      redirect_to profile_path
    else
      flash.now[:errors] = "Invalid login"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "See you again soon!"
    redirect_to root_path
  end

end
