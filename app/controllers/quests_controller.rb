class QuestsController < ApplicationController

  def index
    @lists = List.where(user: current_user).order("created_at ASC")
  end

  def new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
