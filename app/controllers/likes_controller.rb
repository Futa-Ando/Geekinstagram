class LikesController < ApplicationController

    def create
        @picture = Picture.find(params[:picture_id])
        user_like_count = @picture.likes.where(user_id: current_user.id).count
        if user_like_count <=9
            like = current_user.likes.create(picture_id: params[:picture_id])
            @picture.create_notification_like!(current_user)
        end
    end
    
    def destroy
        @picture = Picture.find(params[:picture_id])
        like = Like.find_by(picture_id: params[:picture_id], user_id: current_user.id)
        like.destroy
    end

end