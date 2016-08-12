class Contacts < ActiveRecord::Base
  belongs_to :user
  has_many :events, through: :invitees
end
