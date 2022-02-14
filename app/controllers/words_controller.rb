class WordsController < ApplicationController

    def index
        @words = Word.all
    end

    def new
        @word = Word.new
    end

    def create
        word = Word.new(word_params)
        if word.save
            redirect_to root_path
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        word = Word.find(params[:id])
        word.destroy
        redirect_to action: :index
    end

    def hashtag
        @tag = Hashtag.find_by(hashname: params[:hashname])
        @words = @tag.word
    end

    private
    def word_params
        params.require(:word).permit(:word, :reading, :season, :detail)
    end

end