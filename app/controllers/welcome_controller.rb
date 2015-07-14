class WelcomeController < ApplicationController
  def index
  	@user = User.new
    @current_user = current_user
  end
end
