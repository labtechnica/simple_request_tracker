# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130129095915) do

  create_table "profiles", :force => true do |t|
    t.string "name"
  end

  create_table "systems", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "task_priorities", :force => true do |t|
    t.string "name"
  end

  create_table "task_statuses", :force => true do |t|
    t.string "name"
  end

  create_table "task_types", :force => true do |t|
    t.string "name"
  end

  create_table "tasks", :force => true do |t|
    t.integer  "task_type_id"
    t.integer  "system_id"
    t.string   "description"
    t.date     "request_date"
    t.date     "due_date"
    t.date     "execution_date"
    t.string   "assigned_to"
    t.string   "customer"
    t.string   "follow_up"
    t.integer  "task_priority_id"
    t.integer  "task_status_id"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "tasks", ["system_id"], :name => "index_tasks_on_system_id"
  add_index "tasks", ["task_priority_id"], :name => "index_tasks_on_task_priority_id"
  add_index "tasks", ["task_status_id"], :name => "index_tasks_on_task_status_id"
  add_index "tasks", ["task_type_id"], :name => "index_tasks_on_task_type_id"
  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_me_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "profile_id"
    t.integer  "status"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "users", ["profile_id"], :name => "index_users_on_profile_id"

end
