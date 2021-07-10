class QuestsController < ApplicationController

  before_action :set_quest, only: %i(show edit update destroy payment)

  def new
    @quest = Quest.new
    @list = List.find_by(id: params[:list_id])
  end

  def show
    @quest_user= @quest.user
    @user= current_user
  end

  def create
    @quest = Quest.new(new_quest_params)
    if @quest.save
      redirect_to group_lists_path
    else
      render action: :new
    end
  end

  def edit
    @lists = List.where(user: current_user)
  end

  def update
    @user= current_user
    if @quest.update_attributes(edit_quest_params)
      redirect_to group_list_quest_path
    else
      render action: :edit
    end
  end

  def destroy
    @quest.destroy
    redirect_to group_lists_path
  end

   def payment
        #is_paidをtrueにする処理
      @quest.update(is_paid: true)
      redirect_to group_lists_path
   end

    private
    # Updateアクション時List idがうまく更新時に渡されないためマージ有り無しの別々にSPを定義
    def new_quest_params
      params.require(:quest).permit(:quest_title, :quest_detail, :list_id, :user_id, :quest_status, :start_date, :end_date, :prize_money).merge(user: current_user, list_id: params[:list_id])
    end

    def edit_quest_params
      params.require(:quest).permit(:quest_title, :quest_detail, :list_id, :user_id, :quest_status, :start_date, :end_date, :prize_money,:contractor_id,:contractor_name,:is_paid)
    end

    def set_quest
      @quest = Quest.find_by(id: params[:id])
    end



end
