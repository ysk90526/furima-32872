# テーブル設計

## users テーブル

| Column          | Type   | Options    |
| --------------- | ------ | ---------- |
| nickname        | string | null:false |
| email           | string | null:false |
| password        | string | null:false |
| last_name       | string | null:false |
| first_name      | string | null:false |
| last_name_kana  | string | null:false |
| first_name_kana | string | null:false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| item_image       | text       | null:false        |
| item_name        | string     | null:false        |
| item_description | text       | null:false        |
| price            | integer    | null:false        |
| user             | references | foreign_key: true |

### Association
- has_one :orders
- belongs_to :users

## orders テーブル

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
- belongs_to :items
- belongs_to :users
