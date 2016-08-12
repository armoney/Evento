class Contacts < ActiveRecord::Base
  belongs_to :users
  has_many :events, through: :invitees
end
