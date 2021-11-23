# テーブル設計

## users テーブル

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| birth               | date    | null: false                    |
| email               | string  | null: false, unique: true      |
| nickname            | string  | null: false                    |
| last_name           | string  | null: false                    |
| first_name          | string  | null: false                    |
| last_name_kana      | string  | null: false                    |
| first_name_kana     | string  | null: false
| encrypted_password  | string  | null: false

### Association
- has_many :items
- has_many :records


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| item_price          | integer    | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| delivery_period_id  | integer    | null: false                    |
| delivery_fee_id     | integer    | null: false                    |
| shipment_source_id  | integer    | null: false                    |

### Association
- belongs_to :user
- has_one    :record


## records テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_kye: true |
| item         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address


## addresses テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| postal_code   | string     | null: false                   |
| state_id      | integer    | null: false                   |
| city          | string     | null: false                   |
| address       | string     | null: false                   |
| building      | string     |                    |
| phone         | string     | null: false                   |
| record        | references | null: false, foreign_key: true|

### Association
- belongs_to :record
