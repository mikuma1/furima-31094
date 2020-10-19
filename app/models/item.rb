class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  has_one_attached :image

  validates :name, :info,:category_id,:sales_status_id,
            :shopping_fee_status_id,:prefecture_id,:scheduled_delivery_id,:price,:user,
            presence :true
end
