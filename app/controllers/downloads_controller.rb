class DownloadsController < ApplicationController

  def index
    #authorize Download.new
    @downloads = Download.all.order(created_at: :desc)

  end

  def new
    # authorize Download.new

  end

  def create
    download = Download.new
    download.assign_attributes(params.require(:download).permit([
      :name,
      :file,
      :kind,
      :description
    ]))
    # authorize download
    download.save!

    redirect_to downloads_path
  end

  def edit
    @download = Download.find_by(id: params[:id])
    # authorize @download
  end

  def update
    download = Download.find_by(id: params[:id])
    download.assign_attributes(params.require(:download).permit([
      :name,
      :file,
      :kind,
      :description
    ]))
    # authorize download
    download.save!

    redirect_to downloads_path
  end

  def destroy
    download = Download.find_by(id: params[:id])
    # authorize download
    download.destroy!

    redirect_to downloads_path
  end

end
