class Hashtag < ApplicationRecord
    validates :hashname, presence: true, length: { maximum:99}
    has_many :word_hashes
    has_many :words, through: :word_hashes
end
