class RepliesController < ApplicationController

    before_action :authenticate_user!

    def create
        comment = Comment.find(params[:comment_id])
        reply = comment.replies.build(reply_params)
        reply.user_id = current_user.id
        if reply.save
            flash[:success] = "コメントしました"
            redirect_back(fallback_location: root_path)
        else
            flash[:success] = "コメントできませんでした"
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        relpy = Reply.find(params[:id])
        reply.destroy
        redirect_to :controller => "pictures", :action => "index"
    end

    private
    def reply_params
        params.require(:reply).permit(:content)
    end

end