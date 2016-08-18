require 'dotenv'
Dotenv.load
require 'rubygems'
require 'twilio-ruby'


get '/events/:event_id/invitees' do
  @user = User.find(current_user.id)
  @event = Event.find(params[:event_id])
  erb :'invitees/show'
end

post '/events/:event_id/invitees' do

  event = Event.find(params[:event_id])
  user = User.find(current_user.id)

  message = "#{user.first_name.capitalize} #{user.last_name.capitalize} invited you to #{event.title.capitalize}: #{event.url}"

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

  redirect "/events/#{event.id}"

end
