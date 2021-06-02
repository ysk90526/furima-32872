# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null:false              |
| email              | string | null:false, unique:true |
| encrypted_password | string | null:false              |
| last_name          | string | null:false              |
| first_name         | string | null:false              |
| last_name_kana     | string | null:false              |
| first_name_kana    | string | null:false              |
| birthday           | date   | null:false              |

### Association
- has_many :items
- has_one :shipping_addresses
- has_many :purchases

## items テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| item_name          | string     | null:false        |
| item_description   | text       | null:false        |
| category_id        | integer    | null:false        |
| item_status_id     | integer    | null:false        |
| shipping_charge_id | integer    | null:false        |
| area_id            | integer    | null:false        |
| day_id             | integer    | null:false        |
| price              | integer    | null:false        |
| user               | references | foreign_key: true |

### Association
- belongs_to :shipping_address
- belongs_to :user
- has_one :purchases

## shipping_addresses テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| postcode     | string     | null:false        |
| city         | string     | null:false        |
| block        | string     | null:false        |
| building     | string     |                   |
| phone_number | integer    | null:false        |
| user         | references | foreign_key: true |
| item         | references | foreign_key: true |

### Association
- has_many :items
- belongs_to :user

## purchases テーブル
| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
