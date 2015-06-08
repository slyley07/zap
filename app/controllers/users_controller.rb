class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = current_user
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to @user, notice: 'Your account was successfully created'
  	else
  		render :new
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

  def destroy
  	@user = current_user
  	@user.destroy
  	redirect_to root_path, notice: 'Your account was successfully closed'
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
