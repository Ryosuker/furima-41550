# テーブル設計

## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル
| Column                | Type       | Options                                       |
| --------------------- | ---------- | --------------------------------------------- |
| item_name             | string     | null: false                                   |
| price                 | integer    | null: false ,numericality: {greater_than: 0 } |
| description           | text       | null: false                                   |
| category_id           | integer    | null: false , numericality: {other_than: 1}   |
| condition_id          | integer    | null: false , numericality: {other_than: 1}   |
| shipping_fee_payer_id | integer    | null: false , numericality: {other_than: 1}   |
| shipping_area_id      | integer    | null: false , numericality: {other_than: 1}   |
| shipping_day_id       | integer    | null: false , numericality: {other_than: 1}   |
| user_id               | references | null: false, foreign_key: true                |

### Association
- has_one :purchase
- belongs_to :user
- belongs_to  *<font color="Blue">(extend ActiveHash::Associations::ActiveRecordExtensions)</font>*
  </br>:category , :condition, :shipping_fee_payer, :shipping_area, :shipping_day
- has_one_attached :image

## purchasesテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## Addressesテーブル
| Column           | Type       | Options                                     |
| ---------------- | ---------- | ------------------------------------------- |
| postal_code      | string     | null: false                                 |
| shipping_area_id | integer    | null: false , numericality: {other_than: 1} |
| city             | string     | null: false                                 |
| street_line      | string     | null: false                                 |
| building_name    | string     |                                             |
| phone_number     | string     | null: false                                 |
| purchase         | references | null: false, foreign_key: true              |

### Association
- belongs_to :purchase
- belongs_to  *<font color="Blue">(extend ActiveHash::Associations::ActiveRecordExtensions)</font>*
  </br>:shipping_area