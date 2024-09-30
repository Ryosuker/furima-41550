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
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| price              | integer    | null: false                    |
| description        | text       | null: false                    |
| category           | integer    | numericality: , other_than: 1  |
| condition          | integer    | numericality: , other_than: 1  |
| shipping_fee_payer | integer    | numericality: , other_than: 1  |
| shipping_area      | integer    | numericality: , other_than: 1  |
| shipping_days      | integer    | numericality: , other_than: 1  |
| user               | references | null: false, foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user
- belongs_to  *<font color="Blue">(extend ActiveHash::Associations::ActiveRecordExtensions)</font>*
  </br>:category , :condition, :shipping_fee_payer, :shipping_area, :shipping_days
- has_one_attached :image

## purchasesテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :item
- has_one :address

## Addressesテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| street_line   | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- has_one :purchase