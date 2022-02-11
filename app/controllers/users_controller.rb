class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.new(user_params)

        #user.valid?
        if @user.save
            redirect_to root_path, notice: "You done it, #{@user.lastname}"
        else
            render :signup#, notice: "you screwed up"
        end
    end

    def signup
        @user = User.new
    end

    private

    def user_params
        params.require(:user).permit(:username, :firstname, :lastname, :email, :password)
    end
end
