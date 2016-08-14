require 'bcrypt'

class User < ActiveRecord::Base
  has_many :events, { foreign_key: :host_id }
  has_many :contacts

  validates :first_name, length: { maximum: 100 }
  validates :last_name, length: { maximum: 100 }
  validates :email, uniqueness: true
  validates :password_hash, presence: true

  validate :first_name_is_a_string
  validate :last_name_is_a_string

  def first_name_is_a_string
    unless self.first_name.instance_of? String
      errors.add :first_name, "Must use only letters for first name"
      return
    end
  end

  def last_name_is_a_string
    unless self.last_name.instance_of? String
      errors.add :last_name, "Must use only letters for last name"
      return
    end
  end

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(input_password)
    self.password == input_password
  end
end
