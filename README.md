## usersテーブル

| Column                | Type              | Option                |
| --------------------- | ----------------- | --------------------- |
| nickname              | string            | null: false           |
| email                 | string            | null: false           |
| encrypted_password    | string            | null: false           |
| birthday              | string            | null: false           |
| name_full             | string            | null: false           |
| name_half             | string            | null: false           |

### Association

- has_many :items
- has_many :comments


## itemsテーブル

| Column                | Type              | Option                         |
| --------------------- | ----------------- | ------------------------------ |
| title                 | string            | null: false                    |
| category              | string            | null: false                    |
| situation             | string            | null: false                    |
| postage               | string            | null: false                    |
| prefecture            | string            | null: false                    |
| shipping_date         | string            | null: false                    |
| explanation           | text              | null: false
| user                  | references        | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :address


## commentsテーブル

| Column                | Type              | Option                         |
| --------------------- | ----------------- | ------------------------------ |
| content               | string            | null: false                    |
| user                  | references        | null: false, foreign_key: true |
| item                  | references        | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## addressesテーブル

| Column                | Type              | Option                         |
| --------------------- | ----------------- | ------------------------------ |
| post_code             | string            | null: false                    |
| prefecture            | string            | null: false                    |
| municipality          | string            | null: false                    |
| block                 | string            | null: false                    |
| building              | string            |                                |
| number                | string            | null: false                    |
| item                  | references        | null: false, foreign_key: true |

### Association

- belongs_to :item
