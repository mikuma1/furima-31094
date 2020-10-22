class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :address

  validates :user_id, :item_id, presence: true
end
