# README

# ChatSpaceデータベース設計
## 必要となるテーブル
usersテーブル(deviseを使用)…ユーザー登録時に記入されたユーザー情報を保存する場所です。  
groupsテーブル…ユーザーによって作られたチャットルームの情報を保存する場所です。  
commentsテーブル…誰がどのようなコメントをしたのかを保存する場所です。  
chat_usersテーブル…chatsテーブルとusersテーブルの中間テーブルです。


## 各テーブルの構造
### usersテーブル(devise使用)
<!-- 中間テーブルとのアソシエーション -->
has_many :groups ,through: :group_users  
has_many :group_users  
<!-- コメントテーブルとのアソシエーション -->
has_many :comments

|column|type   |index|null  |unique|
|------|-------|-----|------|------|
|name  |string |true |false |false |
|email |string |false|false |true  |
|pass  |string |false|false |false |


* * *
### group_usersテーブル(中間テーブル)
belongs_to :user  
belongs_to :group

|column     |type   |index|null  |unique|foreign_key|
|-----------|-------|-----|------|------|-----------|
|group_id   |integer|true |false |false |true       |
|user_id    |integer|false|false |false |true       |


* * *
### gruopsテーブル
<!-- 中間テーブルとのアソシエーション -->
has_many :users,through: :group_users  
has_many :group_users  
<!-- コメントテーブルとのアソシエーション -->
has_many :comments

|column|type   |index|null  |unique|
|------|-------|-----|------|------|
|name  |string |false|false |true  |


* * *
### commentsテーブル
belongs_to :user  
belongs_to :group

|column     |type   |index|null  |unique|foreign_key|
|-----------|-------|-----|------|------|-----------|
|user_id    |integer|true |false |false |true       |
|group_id   |integer|true |false |false |true       |
|comment    |text   |false|true  |false |false      |
|image      |text   |false|true  |false |false      |







