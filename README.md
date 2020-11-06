## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :items
- has_many :purchase


## items テーブル

| Column      | Type            | Options     |
| --------    | ------          | ----------- |
| item_name   | string          | null: false |
| password    | string          | null: false |
| description | string          | null: false |
| status      | string          | null: false |
|shipping_cost| string          | null: false |
|prefecture_id| references      | null: false, foreign_key: true |
|shipping_days| string          | null: false |
|price        | string          | null: false |
|user_id      | references      | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase



## purchase テーブル

| Column      | Type            | Options     |
| --------    | ------          | ----------- |
| user_id     | references      | null: false, foreign_key: true |
| item_name_id | references     | null: false, foreign_key: true |
| when         | string         | null: false |

### Association
- has_one :destination
- belongs_to :user


## destination テーブル

| Column       | Type            | Options     |
| --------     | ------          | ----------- |
| postal_code  | integer         | null: false |
| prefecture   | string          | null: false |
| city         | string          | null: false |
| address      | string          | null: false |
| phone        | integer         | null: false |
| user_id      | references      | null: false, foreign_key: true |

### Association
- belongs_to :purchase

