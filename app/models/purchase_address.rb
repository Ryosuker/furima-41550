class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :shipping_area_id, :city, :street_line, :building_name, :phone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :city
    validates :street_line
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, numericality: { only_integer: true, message: 'is invalid.' },
                             length: { in: 10..11, message: 'is too short' }
  end
  validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase = Purchase.create(item_id:, user_id:)
    Address.create(postal_code:, shipping_area_id:, city:, street_line:,
                   building_name:, phone_number:, purchase_id: purchase.id)
  end
end
