## Users

|Colum               |Type    |Option                     |
|--------------------|--------|---------------------------|
|nickname            |string  |null: false                |
|email               |string  |null: false, unique: true  |
|encrypted_password  |string  |null: false                |
|firstname           |string  |null: false                |
|lastname            |string  |null: false                |
|furiganafirst       |string  |null: false                |
|furiganalast        |string  |null: false                |
|birthday            |date    |null: false                |

### Association

・has_many :items
・has_many :recodes

## Items

|Colum        |Type        |Option                          |
|-------------|------------|--------------------------------|
|name         |string      |null: false                     |
|info         |text        |null: false                     |
|category_id  |integer     |null: false                     |
|status_id    |integer     |null: false                     |
|area_id      |integer     |null: false                     |
|day_id      |integer     |null: false                     |
|haisoryo_id  |integer     |null: false                     |
|price        |integer     |null: false                     |
|user         |references  |null: false, foreign_key: true  |

### Association

・has_one :recode
・belongs_to :user

## Buys

|Colum     |Type        |Option                          |
|----------|------------|--------------------------------|
|postcode  |string      |null: false                     |
|area_id   |integer     |null: false                     |
|city      |string      |null: false                     |
|address   |string      |null: false                     |
|build     |string      |                                |
|number    |string      |null: false                     |
|recode    |references  |null: false, foreign_key: true  |

### Association

・belongs_to :recode

## Recodes

|Colum  |Type        |Option                          |
|-------|------------|--------------------------------|
|user   |references  |null: false, foreign_key: true  |
|item   |references  |null: false, foreign_key: true  |

### Association

・belongs_to :user
・belongs_to :item
・has_one :buy
