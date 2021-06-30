class UserOrder
  include ActiveModel::Model
  attr_accessor :postcode, :area_id, :city, :block, :building, :phone_number

  with_options presence: true do
    validates :postcode
    validates :city
    validates :block
    validates :phone_number
  end
  validates :area_id, numericality: { other_than: 1 }
  validate :building

  def save
    ShippingAddress.create(postcode: postcode, area_id: area_id, city: city, block: block, building: building, phone_number: phone_number)
    Purchase.create(user_id: current_user.id, item_id: item.id)
  end
end