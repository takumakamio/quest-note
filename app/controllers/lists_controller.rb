class ListsController < ApplicationController
  before_action :set_list, only: %i[edit update destroy]
  before_action :ensure_correct_user,except: %i[show]

  def index
    @lists = List.where(group_id: params[:group_id]).order('created_at ASC')
  end

  def new
    @list = List.new
    @user = current_user
  end

  def create
    @user = current_user
    @list = List.new(list_params)
    if @list.save
      redirect_to group_lists_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @list.update_attributes(list_params)
      redirect_to group_lists_path
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to group_lists_path
  end

  private

  # merge　FKを外部に渡すために必要
  def list_params
    params.require(:list).permit(:title).merge(user: current_user, group_id: params[:group_id])
  end

  def set_list
    @list = List.find_by(id: params[:id])
  end

  # 　URL直打ち禁止
  def ensure_correct_user
    return redirect_to groups_path, notice: 'そのリストは自分の管理下ではありません。' unless current_user.group_users.pluck(:group_id)
    .include?(params[:group_id].to_i)
  end
  
end




