class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :item_image
  with_options presence: true do
    validates :item_image
    validates :item_name
    validates :item_description
    validates :category_id
    validates :item_status_id
    validates :shipping_charge_id
    validates :area_id
    validates :day_id
    validates :price, format: {with: /^[0-9]+$/ }
  end
end
