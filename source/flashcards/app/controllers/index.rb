get '/' do
  if session[:user_id]
    erb :profile
  else
    # Look in app/views/index.erb
    erb :index
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
     # @error = "Username or email taken"
     # erb :signup
  puts "LOG: #{params[:user]}"
  @user = User.create(params[:user])
  if @user
    session[:user_id] = @user.id
    redirect '/profile'
  else
    erb :signup
  end
end
get '/profile' do
  if session[:user_id]
    erb :profile
  else
    # Look in app/views/index.erb
    redirect '/'
  end
end

post '/signin' do
  if  User.authenticate(params[:username], params[:password])
    session[:user_id] = User.where(username: params[:username])[0].id
    flashlogger("/signin POST authentication passed ")
    redirect '/profile'
  else
    flashlogger("/signin POST authentication failed")
    erb :signin
  end
end
get '/logout' do
  session.clear && flashlogger("logged out")
  redirect '/signin'
end
get '/signin' do
  erb :signin
end
