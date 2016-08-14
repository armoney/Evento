require 'dotenv'
Dotenv.load

require 'rubygems'
require 'twilio-ruby'

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

@client = Twilio::REST::Client.new account_sid, auth_token



@client.account.messages.create({
  :from => '+16502156875',
  :to => '330xxx0939',
  # :to => '206xxx0191',
  :body => 'Hello world'
})

# post '/receive_sms' do
#   content_type 'text/xml'

#   response = Twilio::TwiML::Response.new do |r|
#     r.Message 'Hey thanks for messaging me!'
#   end

#   response.to_xml
# end
