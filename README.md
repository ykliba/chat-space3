# chat-space3 DB設計
## usersテーブル
|Column|Type|Options|
|------|----|------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :messages
- has_many :group_users
- has_many :groups,throught::group_users

## groupsテーブル
|Column|Type|Options|
|------|----|------|
|name|string|null: false|
### Association
- has_many :messages
- has_many :group_users
- has_many :users,throught::group_users

## group_usersテーブル
|column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|group_id|references|null: false,foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

## messageテーブル
|Column|Type|Options|
|------|----|-------|
|content|text| |
|image|string| |
|group_id|references|null: false,foreign_key: true|
|user_id|references|null: false,foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

