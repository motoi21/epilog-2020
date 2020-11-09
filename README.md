# README

## テーブル設計

## users テーブル

|Column                 |Type     |Options                       |
|-----------------------|---------|------------------------------|
| nickname              | string  | null: false                  |
| email                 | string  | null: false, unique; true    |
| password              | string  | null: false                  |
| password_confirmation | string  | null: false                  |


### Association
- has_one  :profile
- has_many :drawings
- has_many :reviews
- has_many :offers
- has_many :purchases



## profiles テーブル
|Column                 |Type        |Options                       |
|-----------------------|------------|------------------------------|
| introduction          | text       |                              |
| user_image            |            | ActiveStorage,AWSを使用       |
| category_id           | integer    | null:false, ActiveHashを使用  |
| genre_id              | integer    | null: false, ActiveHashを使用 |
| user                  | references | foreign_key: true            |

## Association
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :genre


## drawings テーブル
|Column              |Type        |Options                       |
|--------------------|------------|------------------------------|
| drawing_image      |            | ActiveStorage,AWSを使用       |
| title              | text       | null: false                  |
| description        | text       |                              |
| category_id        | integer    | null: false, ActiveHashを使用 |
| genre_id           | integer    | null: false, ActiveHashを使用 |
| production_date    | date       | null: false, ActiveHashを使用 |
| price              | integer    |                              |
| shipping_method_id | integer    | ActiveHashを使用              |
| height             | string     |                              |
| width              | string     |                              |
| user               | references | foreign_key :true            |

## Association
- belongs_to :user
- has_many :reviews
- has_one :purchase

- belongs_to_active_hash :category
- belongs_to_active_hash :genre
- belongs_to_active_hash :shipping_method

## offers テーブル
|Column             |Type          |Options                      |
|-------------------|--------------|-----------------------------|
| budget            | string       | null:false                  |
| order_name        | string       | null:false                  |
| category_id       | integer      | null:false,ActiveHashを使用  |
| genre_id          | integer      | null:false,ActiveHashを使用  |
| detail            | text         | null:false                  |
| deadline          | date         | null:false                  |

## Association
- belongs_to :user
- has_one :review
- belongs_to_active_hash :category
- belongs_to_active_hash :genre

## purchases テーブル

|Column   |Type        |Options                    |
|---------|------------|---------------------------|
| user    | references | foreign_key :true         |
| drawing | references | foreign_key :true         |

### Association
- belongs_to :user
- belongs_to :drawing
- has_one :shipping

## shipping テーブル

|Column         |Type        |Options                       |
|---------------|------------|------------------------------|
| postal_code   | integer    | null: false                  |
| prefecture_id | integer    | null: false, ActiveHashを使用 |
| city          | string     | null:false                   |
| address       | string     | null: false                  |
| building      | string     |                              |
| phone_number  | integer    | null: false                  |
| purchase      | references | foreign_key: true            |


### Association
- belongs_to purchases

- belongs_to_active_hash :prefecture

## reviews テーブル

|Column        |Type         |Options                   |
|--------------|-------------|--------------------------|
| rating       | integer     | null: false              |
| text         | text        | null: false              |
| user_id      | references  | foreign_key: true        |
| drawing_id   | references  | foreign_key: true        |
| offer_id     | references  | foreign_key: true        |

### Association
- belongs_to user
- belongs_to drawing
- belongs_to offer
