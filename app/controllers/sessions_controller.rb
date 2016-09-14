class SessionsController < ApplicationController

    def new
      @user = User.new
    end

    def create
      @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:notice] = 'username or password not correct'
          redirect_to signin_path
        end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path
    end
end
