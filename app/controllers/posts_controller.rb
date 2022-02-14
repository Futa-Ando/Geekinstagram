class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

    def create
        @post = Post.new(post_params)
        @post.exam = params[:post][:exam].join("")
        if @post.save
            flash[:notice] = "診断が完了しました"
            redirect_to post_path(@post.id)
        else
            redirect_to :action => "new"
        end
    end

    private
    def post_params
        params.require(:post).permit(exam: [])
    end

end