class DevlogsController < ApplicationController

  def index
    authorize Devlog.new
    @devlogs = policy_scope(Devlog.all).order(created_at: :desc)

    if params[:y].present? && params[:m].present?
      @devlogs = @devlogs.where('extract(year from created_at) = ?', params[:y]).where('extract(month from created_at) = ?', params[:m])
    end

    @more_logs = policy_scope(Devlog.all).order(created_at: :desc).pluck("extract(month from created_at)", "extract(year from created_at)").uniq
  end

  def show
    @devlog = policy_scope(Devlog.find_by(id: params[:id]))
    @more_logs = policy_scope(Devlog.all).order(created_at: :desc).pluck("extract(month from created_at)", "extract(year from created_at)").uniq
    authorize @devlog
  end

  def drafts
    authorize Devlog.new
    @devlogs = Devlog.where(public: false).order(created_at: :desc)
  end

  def new
    authorize Devlog.new
    @pictures = Picture.all.order(created_at: :desc).limit(20)
  end

  def create
    devlog = Devlog.new
    devlog.assign_attributes(params.require(:devlog).permit([
      :title,
      :short_description,
      :body,
      :user_id
    ]))
    authorize devlog
    if params[:commit] == "Save"
      devlog.public = false
    else
      devlog.public = true
    end
    devlog.save!

    redirect_to devlog_path(devlog)
  end

  def edit
    @devlog = Devlog.find_by(id: params[:id])
    authorize @devlog
  end

  def update
    devlog = Devlog.find_by(id: params[:id])
    devlog.assign_attributes(params.require(:devlog).permit([
      :title,
      :short_description,
      :body,
      :user_id,
      :public
    ]))
    authorize devlog
    if params[:commit] == "Publish!" || params[:commit] == "Update!"
      devlog.public = true
    end
    devlog.save!

    redirect_to devlog_path(devlog)
  end

  def destroy
    devlog = Devlog.find_by(id: params[:id])
    authorize devlog
    devlog.destroy!

    redirect_to devlogs_path
  end

end
