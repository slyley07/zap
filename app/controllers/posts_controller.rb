class PostsController < ApplicationController
  def index
  	@user_posts = User.find(params[:id])
  	@posts = Post.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
