require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    assign(:task, stub_model(Task,
      :task_type => nil,
      :system => nil,
      :description => "MyString",
      :assigned_to => "MyString",
      :customer => "MyString",
      :follow_up => "MyString",
      :task_priority => nil,
      :task_status => nil,
      :user => nil
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path, :method => "post" do
      assert_select "input#task_task_type", :name => "task[task_type]"
      assert_select "input#task_system", :name => "task[system]"
      assert_select "input#task_description", :name => "task[description]"
      assert_select "input#task_assigned_to", :name => "task[assigned_to]"
      assert_select "input#task_customer", :name => "task[customer]"
      assert_select "input#task_follow_up", :name => "task[follow_up]"
      assert_select "input#task_task_priority", :name => "task[task_priority]"
      assert_select "input#task_task_status", :name => "task[task_status]"
      assert_select "input#task_user", :name => "task[user]"
    end
  end
end
