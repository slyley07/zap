class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
    @posts = @user.posts.all
    @post = Post.new
  end

  def edit
  	@user = current_user
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      session[:user_id] = @user.id
  		redirect_to @user, notice: 'Your account was successfully created'
  	else
  		redirect_to root_path, notice: 'Something went wrong!'
  	end
  end

  def update
  	@user = current_user
  	if @user.update(user_params)
  		redirect_to @user, notice: 'User was successfully updated!'
  		else
  		render :edit
		end
  end

  def close
    @user = current_user
  end

  def destroy
  	@user = current_user
    if @user.password == params[:user][:password]
    	@user.destroy
      session[:user_id] = nil
    	redirect_to root_path, notice: 'Your account was successfully closed'
    else
      flash[:alert] = "Wrong password. Having second thoughts?"
      render :close
    end
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :username, :fname, :lname, :gender, :birthday, :city, :website, :pnumber)
  end
end
