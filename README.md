# テーブル設計

## users テーブル  (ユーザー情報)

| Column             | Type     | Option                     |
| ------------------ | -------- | -------------------------- |
| nickname           | string   | null: false                |
| email              | string   | null: false, unique: true  |
| encrypted_password | string   | null: false                |
| last_name          | string   | null: false                |
| first_name         | string   | null: false                |
| last_name_kana     | string   | null: false                |
| first_name_kana    | string   | null: false                |
| birthday           | date     | null: false                |
### Association
- has_many :items
- has_many :orders

## items テーブル  (商品情報)

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| product_name     | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| shipping_form_id | integer    | null: false                    |
| days_ship_id     | integer    | null: false                    |
| price            | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :order

## Orders テーブル  (購入記録)

| Column          | Type       | Option                         |
| --------------- | ---------- | -------------------------------|
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping

## Shipping テーブル  (発送先住所)

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| order           | references | null: false, foreign_key: true |
| postal_code     | string     | null: false                    |
| sipping_form_id | integer    | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     | null: false                    |
| phone_number    | string     | null: false                    |

### Association
- belongs_to :order

