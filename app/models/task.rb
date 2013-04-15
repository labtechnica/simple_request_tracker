class Task < ActiveRecord::Base

  acts_as_commentable
  
  attr_accessible :assigned_to, :customer, :description, :due_date, :execution_date, :follow_up, :request_date, :task_type_id, :system_id, :task_priority_id, :task_status_id

  validates :customer, :description, :request_date, :presence => true
  validates :task_type_id, :system_id, :task_priority_id, :task_status_id, :user_id, :presence => true

  belongs_to :task_type
  belongs_to :system
  belongs_to :task_priority
  belongs_to :task_status
  belongs_to :user

  def color_code
  	colors = { 1 => :info, 2 => :warning, 3 => :success, 4 => :odd, 5 => :error, 6 => :error }.freeze
  	return colors[self.task_status_id]
  end
end
