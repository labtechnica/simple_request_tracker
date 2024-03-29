require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :email => "MyString",
      :password_digest => "MyString",
      :remember_me_token => "MyString",
      :password_reset_token => "MyString",
      :profile => nil,
      :status => 1
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_password_digest", :name => "user[password_digest]"
      assert_select "input#user_remember_me_token", :name => "user[remember_me_token]"
      assert_select "input#user_password_reset_token", :name => "user[password_reset_token]"
      assert_select "input#user_profile", :name => "user[profile]"
      assert_select "input#user_status", :name => "user[status]"
    end
  end
end
