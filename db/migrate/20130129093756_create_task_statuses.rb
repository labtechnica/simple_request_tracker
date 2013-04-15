class CreateTaskStatuses < ActiveRecord::Migration
  def change
    create_table :task_statuses do |t|
      t.string :name
    end

		TaskStatus.create(name: 'New')
		TaskStatus.create(name: 'Pending')
		TaskStatus.create(name: 'Done')
		TaskStatus.create(name: 'Suspended')
		TaskStatus.create(name: 'Cancelled')
		TaskStatus.create(name: 'Deleted')
  end
end
