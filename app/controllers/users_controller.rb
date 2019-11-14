class UsersController < ApplicationController
def index
  @users = User.paginate(page: params[:page],per_page: 10)
end
def new
  @user = User.new
end
def create
  @user = User.new(user_params)
  if @user.save
    flash[:success] = "Create new account"
    redirect_to root_url
  else
    render "new"
  end
end
def show
  @user = User.find(params[:id])
end
def edit
  @user = User.find(params[:id])
end
def update
  @user = User.find(params[:id])
  if current_user == @user
    if @user.update(user_params)
      flash[:success] = 'Profile updated'
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = 'Profile notupdated'
      render 'edit'
    end   
  
  else
      redirect_to root_url
  end
end
private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
