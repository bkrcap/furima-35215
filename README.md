# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| password_confirmation | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday | string | null: false |

### Association
-has_many :items
- belongs_to :buyers




## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
<!--| item_image   | string | null: false |-->
| item_name   | string | null: false |
| description_item   | text | null: false |
| category   | string | null: false |
| item-status   | string | null: false |
| shipping_charge   | integer | null: false |
| shipping_area   | text | null: false |
| shipping_days   | string | null: false |
| selling_price   | integer | null: false |

### Association
- belongs_to :users





## buyers テーブル

| Column | Type       | Options         |
| ------ | ---------- | ----------------|
| postal_code   | string | null: false |
| prefectures   | string | null: false |
| municipality   | string | null: false |
| addres   | string | null: false |
| building_name   | string |  |
| phone_number   | integer | null: false |

### Association

- belongs_to :users




## cards テーブル

| Column | Type       | Options         |
| ------ | ---------- | ----------------|
| card_information   | integer | null: false |
| expiration_date   | integer | null: false |
| security_code   | integer | null: false |

### Association
-has_one :buyers
- belongs_to :users
