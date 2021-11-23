# テーブル設計

## users テーブル

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| birth               | datetime| null: false                    |
| email               | string  | null: false, unique: true      |
| nickname            | string  | null: false                    |
| last_name           | string  | null: false                    |
| first_name          | string  | null: false                    |
| last_name_kana      | string  | null: false                    |
| first_name_kana     | string  | null: false
| encrypted_password  | string  | null: false

### Association
- has_many :items
- has_many :record


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| item_price       | integer    | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| delivery_period  | integer    | null: false                    |
| delivery_fee     | string     | null: false                    |
| shipment_source  | string     | null: false                    |

### Association
- belongs_to :user
- has_one    :record


## records テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| users_id     | references | null: false, foreign_kye: true |
| items_id     | references | null: false, foreign_key: true |

### Association
- has_many   :users
- belongs_to :item
- has_one    :addresses


## addresses テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| postal_code      | integer    | null: false                   |
| prefectures      | string     | null: false                   |
| municipalities   | string     | null: false                   |
| address          | string     | null: false                   |
| building         | string     | null: false                   |
| phone_num        | integer    | null: false                   |
| records_id       | references | null: false, foreign_key: true|

### Association
- belongs_to :record
