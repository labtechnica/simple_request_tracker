class CreateTaskTypes < ActiveRecord::Migration
  def change
    create_table :task_types do |t|
      t.string :name
    end
    
		TaskType.create(name: 'Development')
		TaskType.create(name: 'Enhancement')
		TaskType.create(name: 'Modification')
		TaskType.create(name: 'Configuration')
		TaskType.create(name: 'Int - Bug Fix')
  end
end
