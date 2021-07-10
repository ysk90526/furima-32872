class UserOrder
  include ActiveModel::Model
  attr_accessor :postcode, :area_id, :city, :block, :building, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}$\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :area_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postcode: postcode, area_id: area_id, city: city, block: block, building: building,
                           phone_number: phone_number, purchase_id: purchase.id)
  end
end
