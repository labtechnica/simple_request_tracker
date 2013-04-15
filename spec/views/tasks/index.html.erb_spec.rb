require 'spec_helper'

describe "tasks/index" do
  before(:each) do
    assign(:tasks, [
      stub_model(Task,
        :task_type => nil,
        :system => nil,
        :description => "Description",
        :assigned_to => "Assigned To",
        :customer => "Customer",
        :follow_up => "Follow Up",
        :task_priority => nil,
        :task_status => nil,
        :user => nil
      ),
      stub_model(Task,
        :task_type => nil,
        :system => nil,
        :description => "Description",
        :assigned_to => "Assigned To",
        :customer => "Customer",
        :follow_up => "Follow Up",
        :task_priority => nil,
        :task_status => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of tasks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Assigned To".to_s, :count => 2
    assert_select "tr>td", :text => "Customer".to_s, :count => 2
    assert_select "tr>td", :text => "Follow Up".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
