class LikesController < ApplicationController
def create
    @like = Like.new(like_params)
    if @like.save
    end
end

private
def like_params
    params.require(:likes).permit(:user_id, :idea_id)
end
