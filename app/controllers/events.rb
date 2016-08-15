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
post '/users/:user_id/events' do
  @user = User.find(params[:user_id])

  event_num = @user.events.length + 1

  params[:event][:host_id] = @user.id
  params[:event][:url] = "http://eventosms.herokuapp.com/users/#{@user.id}/event/#{event_num}"

  @event = Event.create(params[:event])

  redirect "/users/#{@user.id}/events/#{@event.id}"
end

# Events DELETE
delete '/users/:user_id/events/:id' do
  @event = Event.find(params[:id])
  @event.destroy
  redirect "/users/#{params[:user_id]}"
end

# Events EDIT
get '/users/:user_id/events/:id/edit' do
  @user = User.find(params[:user_id])
  @event = Event.find(params[:id])
  erb :'events/edit'
end

# Events UPDATE
put '/users/:user_id/events/:id' do
  @event = Event.find(params[:id])
  @event.update(params[:event])
  redirect "/users/#{params[:user_id]}/events/#{params[:id]}"
end
