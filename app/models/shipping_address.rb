class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purchase
  belongs_to :area
  with_options presence: true do
    validates :postcode
    validates :city
    validates :block
    validates :phone_number
  end
  validates :area_id, with_options numericality: { other_than: 1 }
  validates :building
end
