class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shopping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  has_one_attached :image
  belongs_to :user
  has_one :order

  validates :image, :name, :info, :category_id, :sales_status_id,
            :shopping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :user_id,
            presence: true
  validates :price, inclusion: { in: 300..9_999_999 }, numericality: true

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :sales_status_id
    validates :shopping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
end
