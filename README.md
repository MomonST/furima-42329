# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計（編集前）

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_date         | date   | null: false |

has_many :items
has_many :orders

## items テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |  　(商品名)
| description      | text    | null: false |  (商品説明)
| category_id      | integer | null: false |  （カテゴリ、ActiveHash）
| condition_id     | integer | null: false |  （商品の状態、ActiveHash）
| shipping_fee_id  | integer | null: false |  （配送料負担, ActiveHash）
| prefecture_id    | integer | null: false |  （発送元地域, ActiveHash）
| delivery_time_id | integer | null: false |  （発送までの日数,ActiveHash）
| item_price       | integer | null: false |   （300〜9,999,999 円の範囲）
| user             | references | null: false, foreign_key: true | （出品者）

belongs_to :user
has_one :order


## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |   （購入者）
| item    | references | null: false, foreign_key: true |   (購入商品)

belongs_to :user
belongs_to :item
has_one :shipping_address


## shipping_addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| order         | references | null: false, foreign_key: true |    （購入者）
| postal_code   | string     | null: false | 
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building      | string     |             |
| phone_number  | string     | null: false |

belongs_to: order