# Contacts NEW
get '/users/:user_id/contacts/new' do
  @user = User.find(params[:user_id])
  erb :'/contacts/new'
end

# Contacts INDEX
get '/users/:user_id/contacts/index' do
  @user = User.find(params[:user_id])

  erb :'contacts/index'
end

# Contacts CREATE
post '/users/:user_id/contact' do
  #Add user_id to contact record
  params[:contact][:user_id] = params[:user_id]

  @contact = Contact.create(params[:contact])

  redirect "/users/#{params[:user_id]}"
end

# Contacts EDIT
get '/users/:user_id/contacts/:id/edit' do
  @user = User.find(params[:user_id])
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end

# Contacts UPDATE
put '/users/:user_id/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update(params[:contact])
  redirect "/users/#{params[:user_id]}/contacts/index"
end

# Contacts DELETE
delete '/users/:user_id/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect "/users/#{params[:user_id]}/contacts/index"
end
