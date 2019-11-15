class Admin::UsersController < ApplicationController
  def home
    @user = User.find_by(params[:id])
  end
  def top
    @user = User.find_by(params[:id])
  end
end
