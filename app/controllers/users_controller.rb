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
    @user.score = Language.get_data(user_params[:introduction])  #この行を追加
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: '更新に成功しました。'
    else
      redirect_to edit_user_path(@user), alert: '名前を入力してください。'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :introduction, :image)
  end

  # URL直打ち禁止
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to edit_user_path(current_user)
    end
  end
end
