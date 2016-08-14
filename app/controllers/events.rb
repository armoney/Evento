get '/users/:user_id/events/new' do
  @user = User.find(params[:user_id])
  erb :'/events/new'
end

post '/users/:user_id/event' do
  @user = User.find(params[:user_id])

  event_num = @user.events.length + 1

  params[:event][:host_id] = @user.id
  params[:event][:url] = "http://localhost:9393/users/#{@user.id}/event/#{event_num}"

  Event.create(params[:event])

  redirect "/users/#{@user.id}"
end
