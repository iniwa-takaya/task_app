# README

## テーブル設計

### users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| email             | string | null: false, unique:true |
| encrypted_password| string | null: false |
| nick_name         | string | null: false, unique:true |

#### Association

- has_many :task_group_users
- has_many :task_groups, through: :task_group_users

### task-group-users テーブル

| Column      | Type       | Options          |
| ----------- | ---------- | ---------------- |
| task_group  | references | foreign_key: true|
| user        | references | foreign_key: true|

#### Association

- belongs_to :task-group
- belongs_to :user

### task_group テーブル

| Column       | Type      | Options          |
| ------------ | --------- | ---------------- |
| g_name       | string    | null: false      |
| g_description| string    | null: false      |
 

#### Association

- has_many :task_group_users
- has_many :users, through: :task_group_users
- has_many :spaces
- has_many :tasks

### spaces テーブル

| Column       | Type      | Options     |
| ------------ | --------- | ----------- |
| s_name       | string    | null: false, unique:true |
| s_description| string    | null: false |

#### Association

- belongs_to : task_group
- has_many   :tasks

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
- belongs_to :task_group
