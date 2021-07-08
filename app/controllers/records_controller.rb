class RecordsController < ApplicationController
  def index
    @user = current_user
    # contractor_idが存在しているクエストを@questsに格納
    @quests = Quest.where(contractor_id: current_user.id).order("created_at ASC")
    # 賞金合計
    @sum_prize_money = @quests.all.sum(:prize_money)
    # こなしたクエスト数
    @sum_quests = @quests.all.count(:contractor_id)
    @sum_quests = @quests.all.count(:contractor_id)
    
  end
end
