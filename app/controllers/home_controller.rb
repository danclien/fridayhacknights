class HomeController < ApplicationController
  def index
    get_photos
    @photos = @photos[0..5]
  end

end
