class Tag < ApplicationRecord

    has_many :tagmaps, dependent: :destroy
    has_many :pictures, through: :tagmaps, dependent: :destroy

end