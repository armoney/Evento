


















# # Sessions NEW
# get '/sessions/new' do
#   erb :"sessions/new"
# end

# # Sessions CREATE
# post '/sessions' do
#   @user = User.find_by_email(params[:email])
#   if @user && @user.authenticate(params[:password])
#     session[:id] = @user.id
#     redirect "/users/#{@user.id}"
#   else
#     @errors = ["Login NonLEgit, please try again..... "]
#     erb :'sessions/new'
#   end
# end

# # Sessions DELETE
# delete '/sessions' do
#   session[:id] = nil
#   redirect '/'
# end
