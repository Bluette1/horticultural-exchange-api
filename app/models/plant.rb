class Plant < ApplicationRecord
  has_one_attached :image
  has_many :wishes, dependent: :destroy
end
