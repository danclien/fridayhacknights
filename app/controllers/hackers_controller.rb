class HackersController < ApplicationController
  
  def show
    @hacker = Hacker.find params[:id]
  end
  
end