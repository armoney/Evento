class Events < ActiveRecord::Base
  belongs_to :users
  has_many :contacts, through: :invitees
end
