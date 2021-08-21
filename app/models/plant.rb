class Plant < ApplicationRecord
  has_many :wishes, dependent: :destroy
end
