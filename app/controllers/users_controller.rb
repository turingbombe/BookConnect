class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      UserMailer.welcome_email(@user).deliver_now
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
      if @user.update(user_params)
          redirect_to user_path(@user)
      else
          render 'edit'
      end
  end

  def destroy
      if @user.id == session[:user_id]
          @user.destroy
          redirect_to signout_path
      else
          redirect_to root_path
      end
  end

  private

    def user_params
      params.require(:user).permit(:name, :age, :favorite_books, :password, :email)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
