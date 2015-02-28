class User < ActiveRecord::Base

  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true

  has_many :tweets
  has_many :followerships, {
    :foreign_key => "user_id",
    :class_name => "Followership"
  }

  include BCrypt

  def password
    @password ||= Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end
end
