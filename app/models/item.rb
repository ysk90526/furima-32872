class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :item_image
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_charge
  belongs_to :area
  belongs_to :day
  with_options presence: true do
    validates :item_image
    validates :item_name
    validates :item_description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :shipping_charge_id
    validates :area_id
    validates :day_id
  end
end
