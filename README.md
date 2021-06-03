# README

## テーブル設計

### users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| email             | string | null: false, unique:true |
| encrypted_password| string | null: false |
| nick_name         | string | null: false |
| name              | string | null: false |
| birthday          | date   | null: false |

#### Association

- has_many :tasks
- has_many :spaces

### spaces テーブル

| Column      | Type      | Options          |
| ----------- | --------- | ---------------- |
| name        | string    | null: false      |
| user        | references| foreign_key: true|

### Association

- has_many   :tasks
- belongs_to :user

### tasks テーブル

| Column         | Type      | Options     |
| -------------- | --------- | ----------- |
| content        | string    | null: false |
| deadline       | datetime  | null: false |
| status         | boolean   | null: false |
| space          | references| foreign_key: true|
| user           | references| foreign_key: true|

#### Association

- belongs_to :space
- belongs_to :user
