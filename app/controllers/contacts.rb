# Contacts NEW
get '/contacts/new' do
  @user = User.find(current_user.id)
  if request.xhr?
    erb :'/contacts/_new', layout: false
  else
    erb :'/contacts/new'
  end
end

# Contacts INDEX
get '/contacts/index' do
  @user = User.find(current_user.id)

  erb :'contacts/index'
end

# Contacts CREATE
post '/contact' do
  #Add user_id to contact record
  params[:contact][:user_id] = current_user.id

  @contact = Contact.create(params[:contact])

  if request.xhr? 
    erb :'/contacts/_show', layout: false
  else 
    redirect "/contacts/index"
  end
end

# Contacts EDIT
get '/contacts/:id/edit' do
  @user = User.find(current_user.id)
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end

# Contacts UPDATE
put '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update(params[:contact])
  redirect "/contacts/index"
end

# Contacts DELETE
delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect "/contacts/index"
end
