# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| last-name          | string  | null: false |
| first-name         | string  | null: false |
| last-name-kana     | string  | null: false |
| first-name-kana    | string  | null: false |
| user_birth_date　　 | date    | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item-name                | string     | null: false                    |
| item-info                | string     | null: false                    |
| item-category            | integer    | null: false                    |
| item-sales-status        | integer    | null: false                    |
| item-shopping-fee-status | integer    | null: false                    |
| item-prefecture          | integer    | null: false                    |
| item-scheduled-delivery  | integer    | null: false                    |
| item-price               | integer    | null: false                    |
| user_id                  | references | null: false, foreign_key: true |

### Association

- has_one :orders
- belongs_to :user

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal-code    | string     | null: false                    |
| prefecture     | integer    | null: false                    |
| city           | string     | null: false                    |
| addresses      | string     | null: false                    |
| building       | string     | null: false                    |
| phone-number   | string     | null: false                    |
| item_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item