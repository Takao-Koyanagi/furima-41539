# README

## usersテーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| email              | string | null: false                    |
| encrypted_password | string | null: false                    |
| family_name        | string | null: false                    |
| first_name         | string | null: false                    |
| family_name_kana   | string | null: false                    |
| first_name_kana    | string | null: false                    |
| birth_day          | date   | null: false                    |

### Association
- has_many :items
- belongs to :destination
- belongs to :card

## destinationテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| adress             | string     | null: false                    |
| buliding_name      | string     |                                |
| phone_number       | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## cardテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| card_id            | string     | null: false                    |

### Association
- belongs_to :user

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | string     | null: false                    |
| description        | string     | null: false                    |
| status             | string     | null: false                    |
| shipping_cost      | string     | null: false                    |
| shipping_day       | string     | null: false                    |
| prefecture_id      | string     | null: false                    |
| category_id        | integer    | null: false                    |
| brand_id           | integer    | null: false                    |
| shipping_id        | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :images

## imagesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | string     | null: false                    |
| items_id           | integer    | null: false, foreign_key: true |

### Association
- belongs_to :items