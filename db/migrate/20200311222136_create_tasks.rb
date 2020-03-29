class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.datetime :completed_at
      t.belongs_to :user, foreign_key: true, null: false

      t.timestamps null: false
    end

    add_foreign_key :tasks, :users
  end
end
