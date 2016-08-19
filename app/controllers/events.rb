# Events NEW
get '/events/new' do
  @user = User.find(current_user.id)
  if request.xhr?
    erb :'/events/_new', layout: false
  else
    erb :'events/new'
  end
end

# Events SHOW
get '/events/:id' do
  @event = Event.find(params[:id])
  @host = @event.host
  erb :'events/show'
end

# Events CREATE
post '/events' do
  @user = current_user

  params[:event][:host_id] = @user.id

  @event = Event.create(params[:event])

  @event.update(url: "eventosms.herokuapp.com/events/#{@event.id}")

  if request.xhr?
    erb :'events/_user_event', layout: false
  else
    redirect "/users/#{@user.id}"
  end
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
