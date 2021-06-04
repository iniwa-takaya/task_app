class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :content,    null: false
      t.datetime :deadline, null: false
      t.boolean :status,    null: false
      t.references :user,   foreign_key: true
      t.references :space,  foreign_key: true
      t.timestamps
    end
  end
end
