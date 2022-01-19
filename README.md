## usersテーブル
| Column                | Type              | Option                         |
| --------------------- | ----------------- | ------------------------------ |
| nickname              | string            | null: false                    |
| email                 | string            | null: false, unique: true      |
| encrypted_password    | string            | null: false                    |
| last_name_full        | string            | null: false                    |
| first_name_full       | string            | null: false                    |
| last_name_half        | string            | null: false                    |
| first_name_half       | string            | null: false                    |
| birthday              | integer           | null: false                    |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル
| Column                | Type              | Option                         |
| --------------------- | ----------------- | ------------------------------ |
| title                 | string            | null: false                    |
| category_id           | integer           | null: false                    |
| situation_id          | integer           | null: false                    |
| postage_id            | integer           | null: false                    |
| city_id               | integer           | null: false                    |
| shipping_date_id      | integer           | null: false                    |
| explanation           | text              | null: false                    |
| price                 | integer           | null: false                    |
| user                  | references        | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## addressesテーブル
| Column                | Type              | Option                         |
| --------------------- | ----------------- | ------------------------------ |
| post_code             | string            | null: false                    |
| city_id               | integer           | null: false                    |
| municipality          | string            | null: false                    |
| block                 | string            | null: false                    |
| building              | string            |                                |
| number                | string            | null: false                    |
| purchase              | references        | null: false, foreign_key: true |

### Association
- belongs_to :purchase


## purchasesテーブル
| Column                | Type              | Option                         |
| user                  | references        | null: false, foreign_key: true |
| item                  | references        | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :address
- belongs_to :item