class HomeController < ApplicationController
  def index
    @photos = Picasa::Photo.find_all_by_album_id('danclien', '5637559171581951569')[0..5]
  end

end
