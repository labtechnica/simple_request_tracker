require 'spec_helper'

describe "tasks/show" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :task_type => nil,
      :system => nil,
      :description => "Description",
      :assigned_to => "Assigned To",
      :customer => "Customer",
      :follow_up => "Follow Up",
      :task_priority => nil,
      :task_status => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Description/)
    rendered.should match(/Assigned To/)
    rendered.should match(/Customer/)
    rendered.should match(/Follow Up/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
