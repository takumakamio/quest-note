class RecordsController < ApplicationController
  def index
    @user = current_user
    @user_quests = Quest.where(user_id: current_user.id)
    # contractor_idが存在しているクエストを@questsに格納
    @quests = Quest.where(contractor_id: current_user.id)
    # 賞金合計
    @sum_prize_money = @quests.all.sum(:prize_money)
    # 支払い合計
    @sum_paid_money = @user_quests.all.sum(:prize_money)
    # 依頼したクエスト数
    @sum_client_quests = @user_quests.all.count(:user_id)
    # こなしたクエスト数
    @sum_contractor_quests = @quests.all.count(:contractor_id)
    # 合計評価数
    @sum_rate = @quests.all.sum(:rate)
  end
  
  def client
    @quests = Quest.where(user_id: current_user.id).order('created_at DESC')
  end
  
  def contractor
    @quests = Quest.where(contractor_id: current_user.id).order('created_at DESC')
  end
  
end
