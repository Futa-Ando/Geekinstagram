class NotificationsController < ApplicationController

    def index
        @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    end

    def update
        notification = Notification.find(params[:id]) 
        if notification.update(checked: true) 
            redirect_to notifications_path
        end
    end
    
end