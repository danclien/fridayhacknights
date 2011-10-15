class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_photos
    @photos = Picasa::Photo.find_all_by_album_id('danclien', '5663531774001993713')
  end  
end
