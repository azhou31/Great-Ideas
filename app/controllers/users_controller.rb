class UsersController < ApplicationController
    def index
    end

    def create
        puts user_params
        user = User.new(user_params)
        if user.save && user.password_confirmation = params[:password_confirmation]
            flash[:user_success] = "You have successfully signed up! Please log in."
            redirect_to :back
        else
            flash[:user_errors] = user.errors.full_messages
            redirect_to :back
        end
    end

    def show
        @user = User.find(params[:id])
        @posts = Idea.joins(:user).select("COUNT(idea_id)")
    end

    private
    def user_params
        params.require(:user).permit(:name, :alias, :email, :password)
    end
end
