## Users

|Colum          |Type    |Option       |
|---------------|--------|-------------|
|nickname       |string  |null: false  |
|email          |string  |null: false  |
|password       |string  |null: false  |
|firstname      |string  |null: false  |
|lastname       |string  |null: false  |
|furiganafirst  |string  |null: false  |
|furiganalast   |string  |null: false  |
|birthday       |string  |null: false  |

### Association

・has_many :items
・has_many :recodes
・belongs_to :buy

## Items

|Colum     |Type        |Option                          |
|----------|------------|--------------------------------|
|name      |string      |null: false                     |
|info      |text        |null: false                     |
|category  |string      |null: false                     |
|status    |string      |null: false                     |
|area      |string      |null: false                     |
|days      |datetime    |null: false                     |
|haisoryo  |integer     |null: false                     |
|price     |integer     |null: false                     |
|user      |references  |null: false, foreign_key: true  |

### Association

・has_many :recodes
・belongs_to :buy
・belongs_to :user

## Buys

|Colum        |Type        |Option                          |
|------------ |------------|--------------------------------|
|code         |string      |null: false                     |
|number       |integer     |null: false                     |
|user         |references  |null: false, foreign_key: true  |
|item         |references  |null: false, foreign_key: true  |

### Association

・belongs_to :user
・belongs_to :items

## Recodes

|Colum  |Type        |Option                          |
|-------|------------|--------------------------------|
|user   |references  |null: false, foreign_key: true  |
|item   |references  |null: false, foreign_key: true  |

### Association

・belongs_to :user
・belongs_to :item