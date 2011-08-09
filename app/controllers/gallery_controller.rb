require "picasa"

class GalleryController < ApplicationController
  def index
    get_photos
  end
  
  def show
    get_photos
    @photoindex = params[:id].to_i
    @photo = @photos[@photoindex]
  end
end
