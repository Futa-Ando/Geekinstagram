class Room < ApplicationRecord

    has_many :messages, dependent: :destroy
    has_many :entries, dependent: :destroy
    mount_uploader :image, ImageUploader
end