class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :user_id, :item_id, presence: true
end
