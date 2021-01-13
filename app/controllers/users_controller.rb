class UsersController < ApplicationController
    def create
        @user = User.create(user_params)
        if @user.valid?# @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/users/new'
        end
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def new
    end

    private
    def log_in(name, password)

    end

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
