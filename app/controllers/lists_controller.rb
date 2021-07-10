class ListsController < ApplicationController
  before_action :set_list, only: %i(edit update destroy)

  def index
    @lists = List.where(group_id: params[:group_id]).order("created_at ASC")
    # @quests = Quest.where(payment_status: false)
    # @listsQuests = @lists && @quests
  end

  def new
    @list = List.new
    @user= current_user
  end

  def create
    @user= current_user
    @list = List.new(list_params)
    if @list.save
      redirect_to group_lists_path
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @list.update_attributes(list_params)
      redirect_to group_lists_path
    else
      render action: :edit
    end
  end

  def destroy
      @list.destroy
      redirect_to group_lists_path
  end


 private
    # merge　FKを外部に渡すために必要
    def list_params
      params.require(:list).permit(:title).merge(user: current_user, group_id: params[:group_id],)
    end

   def set_list
      @list = List.find_by(id: params[:id])
   end
end
