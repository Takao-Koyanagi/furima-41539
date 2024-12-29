# README

## usersテーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| email              | string | null: false                    |
| encrypted_password | string | null: false                    |
| user_image         | string |                                |
| family_name        | string | null: false                    |
| first_name         | string | null: false                    |
| family_name_kana   | string | null: false                    |
| first_name_kana    | string | null: false                    |
| introduction       | text   |                                |

### Association
- has_many :items
- belongs to :destination
- belongs to :card

## destinationテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| family_name        | string     | null: false                    |
| first_name         | string     | null: false                    |
| family_name_kana   | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| adress             | string     | null: false                    |
| buliding_name      | string     |                                |
| phone_number       | string     | null: false                    |
| user_id            | integer    | null: false, foreign_key: true |

### Association
- belongs_to :user

## cardテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | integer    | null: false, foreign_key: true |
| customer_id        | string     | null: false                    |
| card_id            | string     | null: false                    |

### Association
- belongs_to :user

## categoryテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| ancestry           | string     | null: false                    |

### Association
- has_many :items

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
| category_id        | integer    | null: false, foreign_key: true |
| brand_id           | integer    | null: false, foreign_key: true |
| shipping_id        | integer    | null: false, foreign_key: true |
| user_id            | integer    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :images

## imagesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | string     | null: false                    |
| items_id           | integer    | null: false, foreign_key: true |

### Association
- belongs_to :items

## brandテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | index: true                    |

### Association
- has_many :items