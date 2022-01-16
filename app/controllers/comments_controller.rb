class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
      picture = Picture.find(params[:picture_id])
      comment = picture.comments.build(comment_params)
      comment.user_id = current_user.id
      if comment.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end
    end

    def show
      @comment = Comment.find(params[:id])
      @replies = @comment.replies
      @reply = Reply.new
    end

    def destroy
      comment = Comment.find(params[:id])
      comment.destroy
      redirect_to :controller => "pictures", :action => "index"
    end
  
    private
  
      def comment_params
        params.require(:comment).permit(:content, :image)
      end

end