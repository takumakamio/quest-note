class QuestsController < ApplicationController

  def new
    @quest = Quest.new
    @list = List.find_by(id: params[:list_id])
  end

  def show
  end

  def create
    @quest = Quest.new(quest_params)
    if @quest.save
      redirect_to lists_path
    else
      render action: :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

    private
    def quest_params
      params.require(:quest).permit(:quest_title, :quest_detail, :list_id, :user_id).merge(user: current_user, list_id: params[:list_id])
    end

end
