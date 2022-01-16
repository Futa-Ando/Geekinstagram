class Picture < ApplicationRecord

    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :tagmaps, dependent: :destroy
    has_many :tags, through: :tagmaps, dependent: :destroy
    mount_uploader :image, ImageUploader
    mount_uploader :video, VideoUploader

    is_impressionable counter_cache: true

end