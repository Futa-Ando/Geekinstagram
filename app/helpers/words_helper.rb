module WordsHelper
    def render_with_hashtags(season)
        season.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/word/hashtag/#{word.delete("#")}"}.html_safe
    end
end
