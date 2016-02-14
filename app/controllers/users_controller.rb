class UsersController < ApplicationController
  #before_action :logged_in_user
  before_action :logged_in_user, except: [:new, :create]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(email: params[:email])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You're now a Quoter!"
      #session[:user_id] = @user.id
      # redirect_to users_path
      redirect_to user_url(@user)
    else
      flash[:danger] = "User did not save, try again"
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    #if @user.update(user_params)
    if @user.update_attributes(user_params)
      flash[:success] = "Info updated"
      redirect_to user_url(@user)
    else
      flash[:danger] = "Edits did not save, try again"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_digest)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "You are not logged in"
      redirect_to login_url
    end
  end

end
