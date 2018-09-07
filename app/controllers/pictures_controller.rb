class PicturesController < ApplicationController

  def create
    picture = Picture.new
    picture.assign_attributes(params.require(:picture).permit([
    ]))
    picture.file.attach(params[:picture][:file])
    picture.save!
    @pictures = Picture.all.order(created_at: :desc).limit(20)
    respond_to do |format|
      format.html
      format.js { render partial: "pictures/loadPictures", :layout => false }
    end
  end

end
