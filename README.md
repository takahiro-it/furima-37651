# DB設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| check_password     | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| kana_family_name   | string | null: false               |
| kana_first_name    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many : items
- has_many : orders

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| name          | string     | null: false                    |
| describe      | text       | null: false                    |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| delv_fee_id   | integer    | null: false                    |
| ship_from_id  | integer    | null: false                    |
| delv_days_id  | integer    | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- has_many : orders

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| address   | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
- has_one : address

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture       | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| billding_name    | string     |                                |
| tel_num          | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to : order
- belongs_to_active_hash :prefecture