class PostsController < ApplicationController
  def index
  	@user = current_user
    @users = User.all
  	@posts = Post.all
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def create
    @user = current_user
    @post = Post.new(params.require(:post).permit(:post).merge(user: @user))
    if @post.save
      redirect_to user_path(@user), notice: 'New post created!'
    else
      redirect_to root_path, notice: 'Something went wrong!'
    end
  end
end
