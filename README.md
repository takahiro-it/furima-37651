# DB設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| family_name         | string | null: false               |
| first_name          | string | null: false               |
| family_name_kana    | string | null: false               |
| first_name_kana     | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many : items
- has_many : orders

## customer テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_id           | integer    | null: false, foreign_key: true |
| family_name       | string     | null: false                    |
| first_name        | string     | null: false                    |
| family_name_kana  | string     | null: false                    |
| first_name_kane   | string     | null: false                    |
| post_code         | string     | null: false                    |
| prefecture        | string     | null: false                    |
| city              | string     | null: false                    |
| address           | string     | null: false                    |
| building_name     | string     |                                |
| phone_number      | string     |                                |

### Association

- belongs_to : user
- has_many : orders

## product テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| name             | string  | null: false                    |
| price            | string  | null: false                    |
| description      | string  | null: false                    |
| status           | string  | null: false                    |
| shipping_cost    | string  | null: false                    |
| shipping_days    | string  | null: false                    |
| prefecture_id    | string  | null: false                    |
| category_id      | integer | null: false, foreign_key: true |
| shipping_id      | integer | null: false, foreign_key: true |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to : order
- belongs_to_active_hash :prefecture

## order テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| user_id         | integer | null: false, foreign_key: true |
| product_id      | integer | null: false, foreign_key: true |
| order_date      | date    | null: false                    |

### Association

- belongs_to :user
- belongs_to :product
