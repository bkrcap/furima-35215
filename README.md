# テーブル設計

## users テーブル

| Column                          | Type   | Options                   |
| --------------------------------| ------ | ------------------------- |
| nickname                        | string | null: false               |
| email                           | string | null: false, unique: true |
| encrypted_password              | string | null: false               |
| last_name                       | string | null: false               |
| first_name                      | string | null: false               |
| last_name_kana                  | string | null: false               |
| first_name_kana                 | string | null: false               |
| birthday                        | date   | null: false               |

### Association
- has_many :items
- has_one :purchase_management



## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| item_name          | string  | null: false |
| description_item   | text    | null: false |
| category_id        | integer | null: false |
| item_status_id     | integer | null: false |
| shipping_charge_id | integer | null: false |
| shipping_area_id   | integer | null: false |
| shipping_days_id   | integer | null: false |
| selling_price      | integer | null: false |
| user_id            | integer    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchase_management






## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | -------------------------------|
| postal_code      | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| municipality     | string     | null: false                    |
| addres           | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | integer    | null: false                    |
| user_id          | integer    | null: false, foreign_key: true |
| item_id          | integer    | null: false, foreign_key: true |


### Association

- belongs_to :purchase_management




## purchase_management テーブル

| Column    | Type       | Options                           |
| --------- | ---------- | ----------------------------------|
| user_id   | integer    | null: false, foreign_key:true     |
| item_id   | integer    | null: false, foreign_key:true     |

### Association

- has_one :purchase
- belongs_to :user
- belongs_to :item




