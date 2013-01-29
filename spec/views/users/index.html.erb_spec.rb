require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :email => "Email",
        :password_digest => "Password Digest",
        :remember_me_token => "Remember Me Token",
        :password_reset_token => "Password Reset Token",
        :profile => nil,
        :status => 1
      ),
      stub_model(User,
        :name => "Name",
        :email => "Email",
        :password_digest => "Password Digest",
        :remember_me_token => "Remember Me Token",
        :password_reset_token => "Password Reset Token",
        :profile => nil,
        :status => 1
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "Remember Me Token".to_s, :count => 2
    assert_select "tr>td", :text => "Password Reset Token".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
