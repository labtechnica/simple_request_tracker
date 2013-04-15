class User < ActiveRecord::Base
  STATUS = { New: 1, Active: 2, Disabled: 3 }.freeze
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessible :email, :name, :password, :password_confirmation, :profile_id
  has_secure_password

  before_create { self.status = :New }
  before_create { generate_token(:remember_me_token) }
  before_create { generate_token(:password_reset_token) }
  before_save { self.email.downcase! }

  belongs_to :profile

  validates :name, :presence => true, :length => { maximum: 100 }
  validates :email, :presence   => true,
                    :format     => { with: VALID_EMAIL_REGEX },
                    :uniqueness => { case_sensitive: false }
  validates :password, :password_confirmation, :presence => true, :on => :create
  validates :password, :length => { minimum: 6 }, :unless => "password.nil?"
  validates :profile_id, :presence => true
  validates :status, :presence => true, :inclusion => { in: STATUS }, :on => :update

  def status
    STATUS.key(read_attribute(:status))
  end
  
  def status= (value)
    write_attribute(:status, STATUS[value])
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    # UserMailer.password_reset(self).deliver
  end
end
