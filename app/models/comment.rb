class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :picture
  has_many :replies, dependent: :destroy

  mount_uploader :image, ImageUploader
end
