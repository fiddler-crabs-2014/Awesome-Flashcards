get '/' do
  if session[:user_id]
    flashlogger("initial get / passed, userid: #{session[:user_id]} line 3")
    erb :profile

  else
    flashlogger("initial get / no userid, line 7")
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
  auth_redirect('/profile')
  # if  User.authenticate(params[:username], params[:password])
  #   session[:user_id] = User.where(username: params[:username])[0].id
  #   flashlogger("/signin POST authentication passed ")
  #   redirect '/profile'
  # else
  #   flashlogger("/signin POST authentication failed")
  #   erb :signin
  # end
end

get /\/(signout|logout)/ do
  session.clear && flashlogger("logged out")
  redirect '/signin'
end
get /\/(login|signin)/ do
  erb :signin
end

