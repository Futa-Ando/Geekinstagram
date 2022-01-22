class LikesController < ApplicationController

    def create
        like = current_user.likes.create(picture_id: params[:picture_id])
        picture = Picture.find(params[:picture_id])
        picture.create_notification_like!(current_user)
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        like = Like.find_by(picture_id: params[:picture_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: root_path)
    end

end