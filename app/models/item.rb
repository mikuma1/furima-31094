class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shopping_fee_status
  has_one_attached :image

  validates :name, :info, :category, :sales_status,
            :shopping_fee_status,:prefecture_id,:scheduled_delivery_id,:price,:user,
            presence: true
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :sales_status_id
  validates :sales_status_id
  end

end
