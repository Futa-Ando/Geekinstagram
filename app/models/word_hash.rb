class WordHash < ApplicationRecord
    belongs_to :word
    belongs_to :hashtag
    with_options presence: true do
        validates :word_id
        validates :hashtag_id
    end
end
