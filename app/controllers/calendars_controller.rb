class CalendarsController < ApplicationController
  def index
    @user = current_user
    @client_quests = Quest.where(user_id: current_user.id)
    # contractor_idが存在しているクエストを@questsに格納
    @contractor_quests = Quest.where(contractor_id: current_user.id)
  end
end
