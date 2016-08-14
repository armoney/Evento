# Events NEW
get '/users/:user_id/events/new' do
  @user = User.find(params[:user_id])
  erb :'/events/new'
end

# Events SHOW
get '/users/:user_id/events/:id' do
  @user = User.find(params[:user_id])
  @event = Event.find(params[:id])
  erb :'events/show'
end

# Events CREATE
post '/users/:user_id/event' do
  @user = User.find(params[:user_id])

  event_num = @user.events.length + 1

  params[:event][:host_id] = @user.id
  params[:event][:url] = "http://localhost:9393/users/#{@user.id}/event/#{event_num}"

  Event.create(params[:event])

  redirect "/users/#{@user.id}"
end

# Events DELETE
delete '/users/:user_id/events/:id' do
  @event = Event.find(params[:id])
  @event.destroy
  redirect "/users/#{params[:user_id]}"
end

# Users EDIT
get '/users/:user_id/events/:id/edit' do
  @user = User.find(params[:user_id])
  @event = Event.find(params[:id])
  erb :'events/edit'
end

# Users UPDATE
put '/users/:user_id/events/:id' do
  @event = Event.find(params[:id])
  @event.update(params[:event])
  redirect "/users/#{params[:user_id]}/events/#{params[:id]}"
end
