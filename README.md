# テーブル設計

## users テーブル  (ユーザー情報)

| Column          | Type     | Option              |
| --------------- | -------- | ------------------- |
| name            | string   | null: false         |
| password        | string   | null: false         |
| email           | string   | null: false         |
### Association
- has_many :items
- has_many :orders

## items テーブル  (商品情報)

| Column          | Type       | Option              |
| --------------- | ---------- | ------------------- |
| user            | references | null: false         |
| text            | text       | null: false         |
| price           | integer    | null: false         |

### Association
- belongs_to :user
- has_one :order

## Orders テーブル  (購入情報)

| Column          | Type       | Option                        |
| --------------- | ---------- | ------------------------------|
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping

## Shipping テーブル

| Column          | Type       | Option                      |
| --------------- | ---------- | --------------------------- |
| postal_code     | string     | null: false                 |
| address         | string     | null: false                 |
| phone_number    | string     | null: false                 |

### Association
- belongs_to :order

