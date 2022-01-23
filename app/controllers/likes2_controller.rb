class Likes2Controller < ApplicationController
    def create
        @picture = picture.find(params[:picture_id])
        @user_like_count = @picture.likes.where(user_id: current_user.id).count + 1
        if @user_like_count <=10
            like = @current_user.likes.create(picture_id: params[:picture_id])
        end
    end

    def destroy
        @picture = picture.find(params[:picture_id])
        @user_like_count = @picture.likes.where(user_id: current_user.id).count - 1
        like = Like.find_by(picture_id: params[:picture_id], user_id: current_user.id)
        like.destroy
    end
end