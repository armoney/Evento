require 'dotenv'
Dotenv.load
require 'rubygems'
require 'twilio-ruby'


get '/users/:user_id/events/:event_id/invitees' do
  @user = User.find(params[:user_id])
  @event = Event.find(params[:event_id])
  erb :'invitees/show'
end

post '/users/:user_id/events/:event_id/invitees' do

  event = Event.find(params[:event_id])
  user = User.find(params[:user_id])

  message = "You're invited to #{event.title}. #{event.url}"

  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']

  client = Twilio::REST::Client.new account_sid, auth_token

  params[:contacts].each do |contact_id|

    contact = user.contacts.find(contact_id)

    if client.account.messages.create({
      :from => '+16502156875',
      :to => contact.phone,
      :body => message
    })
    end

  end

  redirect "/users/#{user.id}/events/#{event.id}"

end
