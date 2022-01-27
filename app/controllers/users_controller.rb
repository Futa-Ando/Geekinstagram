class UsersController < ApplicationController
    before_action :authenticate_user!, :only => [:show]

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @currentUserEntry = Entry.where(user_id: current_user.id)
        @userEntry = Entry.where(user_id: @user.id)
        if @user.id == current_user.id
        else
            @currentUserEntry.each do |cu|
                @userEntry.each do |u|
                    if cu.room_id == u.room_id then
                    @isRoom = true
                    @roomId = cu.room_id
                    end
                end
            end
            if @isRoom
            else
                @room = Room.new
                @entry = Entry.new
            end
        end

        @comment = Comment.new
        @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    end

    def like_picture
        @user = User.find(params[:id])
        @likes = @user.likes.select(:picture_id).distinct
        @comment = Comment.new
    end

    def picture
        @user = User.find(params[:id])
        @pictures = @user.pictures
        @comment = Comment.new
    end

    def favorite_picture
        @user = User.find(params[:id])
        @comment = Comment.new
    end

    def following
        @user = User.find(params[:id])
    end

    def follower
        @user = User.find(params[:id])
    end

end