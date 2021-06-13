FactoryBot.define do
  factory :item do
    item_image         {}
    item_name          { 'アイテム' }
    item_description   { 'アイテムの説明' }
    category_id        {}
    item_status_id     {}
    shipping_charge_id {}
    area_id            {}
    day_id             {}
    price              { '1000' }
  end
end
