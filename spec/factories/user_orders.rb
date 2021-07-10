FactoryBot.define do
  factory :user_order do
    postcode { '123-4567' }
    area_id { 15 }
    city { '横浜市緑区' }
    block { '青山1-1-1' }
    building { '柳ビル103' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
