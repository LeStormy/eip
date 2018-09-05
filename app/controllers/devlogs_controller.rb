class DevlogsController < ApplicationController

  def index
    @devlogs = Devlog.all.order(created_at: :desc)
  end

  def show

  end

  def new

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
