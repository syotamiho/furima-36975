## usersテーブル

| Column                | Type              | Option                |
| --------------------- | ----------------- | --------------------- |
| nickname              | string            | null: false           |
| email                 | string            | null: false           |
| encrypted_password    | string            | null: false           |
| last_name_full        | string            | null: false           |
| first_name_full       | string            | null: false           |
| last_name_half        | string            | null: false           |
| first_name_half       | string            | null: false           |
| birthday_yy           | integer           | null: false           |
| birthday_mm           | integer           | null: false           |
| birthday_dd           | integer           | null: false           |

### Association

- has_many :items
- has_one :address


## itemsテーブル

| Column                | Type              | Option                         |
| --------------------- | ----------------- | ------------------------------ |
| title                 | string            | null: false                    |
| category              | string            | null: false                    |
| situation             | string            | null: false                    |
| postage               | string            | null: false                    |
| city                  | string            | null: false                    |
| shipping_date         | string            | null: false                    |
| explanation           | text              | null: false                    |
| price                 | string            | null: false                    |
| user                  | references        | null: false, foreign_key: true |

### Association

- belongs_to :user


## addressesテーブル

| Column                | Type              | Option                         |
| --------------------- | ----------------- | ------------------------------ |
| post_code             | string            | null: false                    |
| prefecture            | string            | null: false                    |
| municipality          | string            | null: false                    |
| block                 | string            | null: false                    |
| building              | string            |                                |
| number                | string            | null: false                    |
| user                  | references        | null: false, foreign_key: true |

### Association

- belongs_to :user
