class Order < ApplicationRecord
  validates :user_id, :item_id, presence: true
end
