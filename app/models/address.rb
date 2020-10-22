class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :order

  with_options presence: true do
    validates :postal_code, format: { /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    varidates :city, :addresses
    varidates :phone_number, length: { maximam: 11 }, format: { /\A[0-9]+\z/ }
  end
end
