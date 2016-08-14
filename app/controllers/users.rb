#Users NEW
get '/users/new' do
  erb :'users/new'
end

#Users CREATE
post '/users' do
  if params[:user][:password] != params[:password_confirmation]
    @errors = ["Passwords don't match"]
    erb :'users/new'
  else
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @errors = @user.errors.full_messages
      erb :'users/new'
    end
  end
end

#Users Show
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end


# # Users INDEX
# get '/users' do
#   @users = User.all
#   erb :'users/index'
# end

# # Users EDIT
# get '/users/:id/edit' do
#   @user = User.find(params[:id])
#   erb :'users/edit'
# end

# # Users UPDATE
# put '/users/:id' do
#   @user = User.find(params[:id])
#   @user.update(params[:user])
#   redirect "/users/#{@user.id}"
# end

# # Users DELETE
# delete '/users/:id' do
#   @user = User.find(params[:id])
#   @user.destroy
#   redirect "/users"
# end
