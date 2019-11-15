class StaticpagesController < ApplicationController
  def home
    @user = User.find(params[:id])
  end
end
