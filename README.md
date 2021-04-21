# テーブル設計

## users テーブル

| Column                          | Type   | Options                   |
| --------------------------------| ------ | ------------------------- |
| nickname                        | string | null: false               |
| email                           | string | null: false, unique: true |
| encrypted_password              | string | null: false               |
| encrypted_password_confirmation | string | null: false               |
| last_name                       | string | null: false               |
| first_name                      | string | null: false               |
| last_name_kana                  | string | null: false               |
| first_name_kana                 | string | null: false               |
| birthday                        | date   | null: false               |

### Association
### このアソシエーションは不要  - has_many :items
### このアソシエーションは不要  - belongs_to :buyer




## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
<!--| item_image   | string | null: false |-->
| item_name          | string  | null: false |
| description_item   | text    | null: false |
| category_id        | integer | null: false |
| item-status_id     | integer | null: false |
| shipping_charge_id | integer | null: false |
| shipping_area_id   | integer | null: false |
| shipping_days_id   | integer | null: false |
| selling_price_id   | integer | null: false |

### Association
- belongs_to :user





## purchases テーブル

| Column         | Type       | Options |
| -------------- | ---------- | --------|
| postal_code    | string | null: false |
| prefectures_id | integer| null: false |
| municipality   | string | null: false |
| addres         | string | null: false |
| building_name  | string |  |
| phone_number   | integer | null: false |

### Association

- belongs_to :user




## purchase_management テーブル

| Column    | Type       | Options         |
| --------- | ---------- | ----------------|
| user_id   | integer    | null: false     |
| item_id   | integer    | null: false     |

### Association

- has_one_ :purchase

<!--不要とのことですが、一応自分の考えた軌跡としてコメントアウトしています。## cards テーブル

| Column | Type       | Options         |
| ------ | ---------- | ----------------|
| card_information   | integer | null: false |
| expiration_date   | integer | null: false |
| security_code   | integer | null: false |

### Association
- has_one :buyers
- belongs_to :user-->


