class Task < ActiveRecord::Base
  belongs_to :task_type
  belongs_to :system
  belongs_to :task_priority
  belongs_to :task_status
  belongs_to :user
  attr_accessible :assigned_to, :customer, :description, :due_date, :execution_date, :follow_up, :request_date
end
