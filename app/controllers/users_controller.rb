class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order("created_at DESC")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params) if current_user.id == user.id
    redirect_to user_path(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :avatar)
  end
end
