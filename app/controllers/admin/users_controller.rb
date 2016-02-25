class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @search = User.search params[:q]
    @users = @search.result(distinct: true).paginate page: params[:page],
      per_page: Settings.users.users_per_page
  end

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

  def destroy
    if @user.destroy
      flash[:success] = t "flash.admin.user.destroy_success"
    else
      flash[:alert] = t "flash.admin.user.destroy_fail"
    end
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit :username, :email, :password, :password_confirmation, :role
  end
end
