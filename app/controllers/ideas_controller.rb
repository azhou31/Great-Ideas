class IdeasController < ApplicationController
    def index
        @user = current_user
        @ideas = Idea.all

    end

    def create
        @idea = current_user.ideas.create(idea_params)
        if @idea.save
            redirect_to :back
        else
            flash[:errors] = "Message can't be blank!"
            redirect_to :back
        end
    end

    def show
        @ideas = Idea.find(params[:id])
        @likers = User.joins(:likes).group(:user_id)
    end

    private

    def idea_params
        params.require(:idea).permit(:message, :user_id)
    end
end
