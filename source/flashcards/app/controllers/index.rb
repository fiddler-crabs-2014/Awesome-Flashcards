get '/' do
  if session[:user_id]
    flashlogger("initial get / passed, userid: #{session[:user_id]} line 3")
    redirect '/profile'
  else
    flashlogger("initial get / no userid, line 7")
    # Look in app/views/index.erb
    erb :signin
  end
end

post '/signup' do
  flashlogger("[LOG] /signup #{params[:user]}")
  @user = User.create(params[:user])
  if @user
    session[:user_id] = @user.id
    redirect '/profile'
  else
    erb :signin
  end
end

get '/profile' do
  if session[:user_id]
    flashlogger("session userid: #{session[:user_id]}")
    @data = current_user
    erb :profile
  else
    redirect '/'
  end
end

post '/signin' do
  auth_redirect('/profile')
end

get /\/(signout|logout)/ do
  session.clear && flashlogger("logged out #{session[:user_id]}")
  redirect '/signin'
end
get /\/(login|signin)/ do
  erb :signin
end

def current_user
  @user = User.find(session[:user_id])
  @username = @user.username
  @email = @user.email
  @decks = @user.decks
end

