##ChatSpaceの機能
>1. 新規登録機能
>1. 1対1のチャット機能
>1. 複数人によるグループチャット機能
>1. チャット相手の検索機能
>1. チャットグループへのユーザー招待機能
>1. チャットの履歴表示機能
>1. 画像送信機能
>1. チャットの自動更新

1. ログイン機能
1. アカウント情報編集機能

##画面の設計
1. ログイン画面
1. 新規登録画面
  - 個別TOP画面
        1. 新規group作成画面
        1. アカウント編集画面
        1. チャット画面
        1. group編集画面

##データベース設計
###必要なテーブル
####groups
| column | type | restriction |
|:------:|:----:|:-----------:|
| name | string | null: false |
####users
| column | type | restriction |
|:------:|:----:|:-----------:|
| name | string | null: false |
| email | string | 主キー |
**add_index :groups, :name**
####group_users
| column | type | restriction |
|:------:|:----:|:-----------:|
| group_id | references :group | null: false, foreign_key: true |
| user_id | references :user | null: false, foreign_key: true |
####messages
| column | type | restriction |
|:------:|:----:|:-----------:|
| body | text | - |
| image | text | - |
| group_id | integer | null: false, foreign_key: true |
| user_id | integer | null: false, foreign_key: true |
**add_index :messages, [:group_id, :user_id]**

###リレーション
####group & user
  「多対多」であるため、結合用のテーブルとしてgroup_usersを作成・媒介とし、
  「has_and_belongs_to_many 相手モデル名」でアソシエーションを組む。
####group_usersテーブル
  belongs_to :group
  belongs_to :user
####message
  belongs_to :group
  belongs_to :user

***
###Example
####groups
|id|name|
|:--:|:--:|
|1|group-A|   <!-- テスト太郎   & サンプル乃介 -->
|2|group-B|   <!-- サンプル乃介 & Tech-man -->
|3|group-C|   <!-- サンプル乃介 & Tech-man  & 橋本 -->
|4|group-D|   <!-- テスト太郎   & サンプル乃介 & Tech-man & 橋本 -->
####users
| id | name | email |
|:--:|:----:|:-----:|
| 1 | テスト太郎 | test1@test.com |
| 2 |サンプル乃介| test2@test.com |
| 3 | Tech-man | test3@test.com |
| 4 |   橋本   | test4@test.com |
####group_users
| group_id | user_id |
|:--------:|:-------:|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 2 |
| 3 | 3 |
| 3 | 4 |
| 4 | 1 |
| 4 | 2 |
| 4 | 3 |
| 4 | 4 |
####messages
| id | body | image | group_id | user_id |
|:--:|:----:|:-----:|:--------:|:-------:|
| 1 | 都合付くときご飯いこ？ | http://~/test1.png | 1 | 1 |
| 2 | ええな!また連絡するわ | http://~/test2.png | 1 | 2 |
| 3 | 腹減ったー | http://~/test２.png | 2 | 2 |
| 4 | なんか作っとこっか？ | http://~/test３.png | 2 | 3 |
| 5 | 今日の夜、飯行かへん？ | http://~/test２.png | 1 | 2 |
| 6 | 行きたい！ | http://~/test１.png | 1 | 1 |
| 7 | おっけd(^^o) | http://~/test2.png | 1 | 2 |
| ８ | テスト太郎と一緒にご飯どう？ | http://~/test2.png | 2 | ２ |
| ９ | 行く！ | http://~/test3.png | 2 | ３ |
| 10 | 私も一緒に行くことになった〜！ | http://~/test3.png | 3 | 3 |
| 11 | お！？ | http://~/test1.png | 3 | 1 |
| 12 | 橋本と最近会ってない | http://~/test1.png | 3 | １ |
| 13 | あいつにも声かけてみるわ | http://~/test2.png | 3 | ２ |
| 14 | ご一緒させていただきま〜す | http://~/test4.png | ４ | ４ |
