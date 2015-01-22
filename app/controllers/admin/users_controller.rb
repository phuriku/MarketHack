class Admin::UsersController < ApplicationController
  before_action :check_admin

  def check_admin
    if !current_user.admin
      redirect_to root_path, notice: "The URL you just attempted to access is for website administrators only."
    end
  end

  def index
    @users = User.order(email: :asc)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "User updated."
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_users_path, notice: "User deleted."
    end
  end

  def user_params
    params.require(:user).permit(:admin)
  end
end
