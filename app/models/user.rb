class User < ActiveRecord::Base
  belongs_to :profile
  attr_accessible :email, :name, :password_digest, :password_reset_sent_at, :password_reset_token, :remember_me_token, :status
end
