class Admin::UsersController < ApplicationController
  def home
    @user = User.find_by(params[:id])
  end
  
  def index
    @users = User.paginate(page: params[:page],per_page: 10)
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(admin:true)
    flash[:success] = 'Create Admin User'
    redirect_to admin_users_url
  end

  def destroy
    @user = User.find(params[:id])
    @user.update_attributes(admin:false)
    flash[:danger] = 'Remove Admin User'
    redirect_to admin_users_url
  end
end
