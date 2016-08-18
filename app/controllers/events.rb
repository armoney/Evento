# Events NEW
get '/events/new' do
  @user = User.find(current_user.id)
  erb :'/events/new'
end

# Events SHOW
get '/events/:id' do
  @event = Event.find(params[:id])
  @host = @event.host
  erb :'events/show'
end

# Events User's SHOW
# get '/events' do
#   @user_events = current_user.events
#   erb :'events/user_events'
# end

# Events CREATE
post '/events' do
  @user = current_user

  event_num = @user.events.length + 1

  params[:event][:host_id] = @user.id
  params[:event][:url] = "eventosms.herokuapp.com/events/#{event_num}"

  @event = Event.create(params[:event])

  redirect "/events/#{@event.id}"
end

# Events DELETE
delete '/events/:id' do
  @event = Event.find(params[:id])
  @event.destroy
  redirect "/users/#{current_user.id}"
end

# Events EDIT
get '/events/:id/edit' do
  @user = User.find(current_user.id)
  @event = Event.find(params[:id])
  erb :'events/edit'
end

# Events UPDATE
put '/events/:id' do
  @event = Event.find(params[:id])
  @event.update(params[:event])
  redirect "/events/#{params[:id]}"
end
