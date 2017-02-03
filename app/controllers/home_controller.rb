class HomeController < ApplicationController

  def index
    @tweets = UserHome.new(current_usuario).tweets
    @tweets = @tweets.paginate(:page => params[:page], :per_page => 5)
  end

end
