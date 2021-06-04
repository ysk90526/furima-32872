FactoryBot.define do
  factory :user do
    nickname              {'タロウ'}
    email                 {Faker::Internet.free_email}
    password              {'abc123'}
    password_confirmation {password}
    last_name             {'田中'}
    first_name            {'太郎'}
    last_name_kana        {'タナカ'}
    first_name_kana       {'タロウ'}
    birthday              {'2000-1-1'}
  end
end
