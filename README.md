## Users Table
| Column             | Type       | Options                       |
|--------------------|------------|-------------------------------|
| name               | string     | null: false                   |
| email              | string     | null: false, unique: true     |
| encrypted_password | string     | null: false                   |

### Association
--has_many :parts


## Parts Table
| Column             |Type        |Options                         |
|--------------------|------------|--------------------------------|
| nickname           | string     | null: false                    |
| song_part_id       | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
--belongs_to :user
--belongs_to :song


## Songs Table
| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| song_title         | string     | null: false                    |

### Association
--has_many :parts

## Bands Table
| Column             |Type        |Options                         |
|--------------------|------------|--------------------------------|
| song               | references | null: false, foreign_key: true |
|        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |