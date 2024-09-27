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
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| shipping_fee_payer | string     | null: false                    |
| shipping_area      | string     | null: false                    |
| shipping_days      | string     | null: false                    |
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
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| street_line   | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- has_one :purchase