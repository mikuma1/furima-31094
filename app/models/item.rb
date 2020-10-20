class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shopping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  has_one_attached :image

  validates :image, :name, :info, :category, :sales_status,
            :shopping_fee_status,:prefecture,:scheduled_delivery,:price,:user_id,
            presence: true
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :sales_status_id
    validates :shopping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
  validates :price, inclusion: {in: 300..9999999 }, numericality: true
end
