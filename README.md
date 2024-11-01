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
[![Image from Gyazo](https://i.gyazo.com/ca61643c8d7477fa0eeafb0155e151be.gif)](https://gyazo.com/ca61643c8d7477fa0eeafb0155e151be)
## 1.ユーザー登録機能
ユーザー登録することで出品・購入できるようになります。
（ユーザー登録していない人でも出品している商品を見ることは可能です。）

## 2.商品出品機能
商品画像を選択し、商品情報や販売したい金額を入力すると、出品することができます。（JavaScriptで販売手数料が表示されるようになっています。）
## 3.商品の編集機能
出品した商品について、編集することができます。その際に、ユーザーの手間を省くため出品時の情報が表示されるようになっています。
## 4.商品の削除機能
出品中であった商品について、削除ボタンを押すことで商品を削除することができます。
## 5.商品の購入機能
出品者以外であれば、商品を購入することができます。カード情報と配送先を入力すると購入できます。（JavaScriptとフォームオブジェクトを使用し、トークン化したカード情報をPAY.JPに送付しつつ、カード情報がアプリケーションのデータベースに保存されないように設計しています。）

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
```
% git clone https://github.com/Ryosuker/furima-41550.git
% cd furima-41550
% bundle install
% rails db:create
% rails db:migrate
```
