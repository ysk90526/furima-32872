FactoryBot.define do
  factory :item do
    item_name          { 'アイテム' }
    item_description   { 'アイテムの説明' }
    category_id        {2}
    item_status_id     {2}
    shipping_charge_id {2}
    area_id            {2}
    day_id             {2}
    price              {1000}
    end
  end
end
