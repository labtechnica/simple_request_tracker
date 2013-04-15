namespace :db do
  desc "Fill database with sample data"
  task demodata: :environment do

    user = User.new(name: 'Stephen Baidu', email: 'myself@gmail.com', profile_id: 2, password: 'myself', password_confirmation: 'myself')
    user.status = :New
    user.save!

    System.create(name: 'Request Tracker')
    10.times do
      System.create(name: Faker::Lorem.sentence(1))
    end

    task = Task.new
    task.task_type_id = 1
    task.system_id = 1
    task.description = 'Develop a simple request tracking app'
    task.request_date = Date.today
    task.due_date = Time.now.next_week.end_of_week
    # task.execution_date = 
    task.assigned_to = 'System Admin'
    task.customer = '-'
    task.follow_up = 'Stephen Baidu'
    task.task_priority_id = 1
    task.task_status_id = 1
    task.user = user
    task.save!

    100.times do |n|
      task = Task.new
      task.task_type_id = 1
      task.system_id = 1
      task.description = Faker::Lorem.sentence
      task.request_date = Date.today
      task.due_date = Time.now.next_week.end_of_week
      # task.execution_date = 
      task.assigned_to = 'System Admin'
      task.customer = '-'
      task.follow_up = 'Stephen Baidu'
      task.task_priority_id = 1
      task.task_status_id = rand(1..6)
      task.user = user
      task.save!
    end

  end

  task clear: :environment do
    Task.delete_all
    System.delete_all
    User.where('user_id > 1').delete_all
  end
end