class PagesController < ApplicationController

  def index
    @user = User.new
  end

end