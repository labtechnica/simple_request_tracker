require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :email => "Email",
      :password_digest => "Password Digest",
      :remember_me_token => "Remember Me Token",
      :password_reset_token => "Password Reset Token",
      :profile => nil,
      :status => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/Password Digest/)
    rendered.should match(/Remember Me Token/)
    rendered.should match(/Password Reset Token/)
    rendered.should match(//)
    rendered.should match(/1/)
  end
end
