class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :task_type
      t.references :system
      t.string :description
      t.date :request_date
      t.date :due_date
      t.date :execution_date
      t.string :assigned_to
      t.string :customer
      t.string :follow_up
      t.references :task_priority
      t.references :task_status
      t.references :user

      t.timestamps
    end
    add_index :tasks, :task_type_id
    add_index :tasks, :system_id
    add_index :tasks, :task_priority_id
    add_index :tasks, :task_status_id
    add_index :tasks, :user_id
  end
end
