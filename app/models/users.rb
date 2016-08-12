class Users < ActiveRecord::Base
  has_many :events
  has_many :contacts
end
