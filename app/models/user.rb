class User < ActiveRecord::Base
  has_many :reservations
  
  # attr_accessible :username :email :password :password_confirmation

  #  require 'digest/sha1'
  # encrypted_password= Digest::SHA1.hexdigest(password)

  attr_accessor :password
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :username, :presence => true, :uniqueness => true
  validates_length_of :username, :in => 3..20, :on => :create
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 5..20, :on => :create



  salt= Digest::SHA1.hexdigest("# We add {email} as unique value and #{Time.now} as random value")
  encrypted_password= Digest::SHA1.hexdigest("Adding #{salt} to {password}")

  before_save :encrypt_password
  after_save :clear_password
  def encrypt_password
      if password.present?
        self.salt = BCrypt::Engine.generate_salt
        self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
      end
end
def clear_password
  self.password = nil
end

def self.authenticate(username_or_email="", login_password="")
  if  EMAIL_REGEX.match(username_or_email)
    user = User.find_by_email(username_or_email)
  else
    user = User.find_by_username(username_or_email)
  end
  if user && user.match_password(login_password)
    return user
  else
    return false
  end
end
def match_password(login_password="")
  encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
end

end
