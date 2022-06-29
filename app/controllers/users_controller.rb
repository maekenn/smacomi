class UsersController < ApplicationController

  before_action :correct_user,   only: [:edit, :update]


  def top
    @user = User.find(params[:id])
  end

  def edit
     @user = User.find(params[:id])
     @gender = User.where(genders: params[:gender])
  end

  def create

  end

  def update
   @user = User.find(params[:id])
	 if @user.update(user_params)
	  flash[:notice] = "編集できました"
	   redirect_to root_path
	 else
	  render :edit
	 end

  end

  private
  def user_params
    params.require(:user).permit(:name, :age, :gender, :use_smartphone, :comment, :image)
  end

  def correct_user
    @user = User.find(params[:id])
     unless @user == current_user
     redirect_to root_path
     end
  end
end
