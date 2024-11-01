# アプリ名
フリマアプリ

# アプリケーションの概要
ユーザーを登録すると商品を出品できるようになります。自身が出品した商品は、編集と削除をすることができます。他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。
# テスト用アカウント

### 購入用アカウント
- メールアドレス: test1@test.com
- パスワード: furima01

### 購入用カード情報(PAYJPテスト用)
- 番号：4242424242424242
- 番号：4242424242424242
- 期限：3月/（20）25年（未来の年月であれば可能）
- セキュリティコード：123

### 出品者用アカウント
- メールアドレス: test2@test.com
- パスワード: furima02

#実装機能
## トップページ
## 1.ユーザー登録機能
## 2.商品出品機能
## 2.商品出品機能
## 2.商品出品機能
## 2.商品出品機能


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
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_name             | string     | null: false                    |
| price                 | integer    | null: false                    |
| description           | text       | null: false                    |
| category_id           | integer    | null: false                    |
| condition_id          | integer    | null: false                    |
| shipping_fee_payer_id | integer    | null: false                    |
| shipping_area_id      | integer    | null: false                    |
| shipping_day_id       | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user
- belongs_to  *<font color="Blue">(extend ActiveHash::Associations::ActiveRecordExtensions)</font>*
  </br>:category , :condition, :shipping_fee_payer, :shipping_area, :shipping_day
- has_one_attached :image

## purchasesテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item | references | null: false, foreign_key: true |
| user | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## Addressesテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| city             | string     | null: false                    |
| street_line      | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
- belongs_to  *<font color="Blue">(extend ActiveHash::Associations::ActiveRecordExtensions)</font>*
  </br>:shipping_area


# 使用しているバージョンなど
- ruby 3.2.0
- Rails 7.0.8.4
- MySQL 8.0.39 

# clone
% git clone https://github.com/Ryosuker/furima-41550.git
% cd furima-41550
% bundle install
% rails db:create
% rails db:migrate