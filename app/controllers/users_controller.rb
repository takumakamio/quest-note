class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user

  def index
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path(@user), success: '更新に成功しました。'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :introduction, :image)
  end

  # URL直打ち禁止
  def ensure_correct_user
    if User.find_by(id: params[:id]).nil?
      redirect_to edit_user_path(current_user.id)
    else
      @user = User.find(params[:id])
      redirect_to edit_user_path(current_user.id) unless @user == current_user
    end
  end
end
