class Card < ApplicationRecord
  belongs_to :user
  has_one :destination
  belongs_to :item

end