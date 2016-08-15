get '/users/:user_id/events/:event_id/invitees' do
  @user = User.find(params[:user_id])
  @event = Event.find(params[:event_id])
  erb :'invitees/show'
end

post '/users/:user_id/events/:event_id/invitees' do
  p params[:contacts]
  p params[:user_id]
  p params[:event_id]

  # @user = User.find(params[:user_id])

  # event_num = @user.events.length + 1

  # params[:event][:host_id] = @user.id
  # params[:event][:url] = "http://localhost:9393/users/#{@user.id}/event/#{event_num}"

  # @event = Event.create(params[:event])

  # redirect "/users/#{@user.id}/event/#{@event.id}"
end
