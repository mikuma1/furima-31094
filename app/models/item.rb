class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  has_one_attached :image

  validates :name, :info, :category, :sales_status,
            :shopping_fee_status_id,:prefecture_id,:scheduled_delivery_id,:price,:user,
            presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :sales_status_id, numericality: { other_than: 1 }

end
