class CreateTaskPriorities < ActiveRecord::Migration
  def change
    create_table :task_priorities do |t|
      t.string :name
    end

		TaskPriority.create(name: 'Low')
		TaskPriority.create(name: 'Medium')
		TaskPriority.create(name: 'High')
  end
end
