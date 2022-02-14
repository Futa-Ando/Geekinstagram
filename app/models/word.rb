class Word < ApplicationRecord
    has_many :word_hashes
    has_many :hashtags, through: :word_hashes

    after_create do
        Word = Word.find_by(id: self.id)
        hashtags  = self.season.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        Word.hashtags = []
        hashtags.uniq.map do |hashtag|
            #ハッシュタグは先頭の'#'を外した上で保存
            tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
            Word.hashtags << tag
        end
    end
        
    before_update do 
        Word = Word.find_by(id: self.id)
        Word.hashtags.clear
        hashtags = self.season.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        hashtags.uniq.map do |hashtag|
            tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
            Word.hashtags << tag
        end
    end
end