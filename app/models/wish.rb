class Wish < ApplicationRecord
  belongs_to :user
  belongs_to :plant

  validates :user, uniqueness: { scope: :plant }
end
