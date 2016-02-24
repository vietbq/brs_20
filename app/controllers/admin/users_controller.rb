class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def create
    if @user.save
      flash[:success] = t "flash.admin.user.create_success"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :username, :email, :password, :password_confirmation, :role
  end
end
