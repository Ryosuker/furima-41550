class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_payer
  belongs_to :shipping_area
  belongs_to :shipping_day

  belongs_to       :user
  has_one          :purchase
  has_one_attached :image

  validates :image,                 presence: true
  validates :item_name,             presence: true
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'must be an integer between ¥300 and ¥9,999,999' }
  validates :description,           presence: true
  validates :category_id,           numericality: { other_than: 0, message: "can't be blank" }
  validates :condition_id,          numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_fee_payer_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_area_id,      numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_day_id,       numericality: { other_than: 0, message: "can't be blank" }
end
