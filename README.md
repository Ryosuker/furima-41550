# テーブル設計

## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
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
| category           | text       | null: false                    |
| condition          | text       | null: false                    |
| shipping_fee_payer | text       | null: false                    |
| shipping_area      | text       | null: false                    |
| shipping_days      | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user
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
| prefectures   | text       | null: false                    |
| city          | text       | null: false                    |
| street_line   | text       | null: false                    |
| building_name | text       | null: false                    |
| phone_number  | integer    | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- has_one :purchase