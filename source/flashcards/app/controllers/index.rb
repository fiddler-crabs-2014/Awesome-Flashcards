require_relative '../../config/flashsettings'
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
  User.create(username: params[:username], email: params[:email], password: params[:password])
  flashlogger("/signup POST executed")
end

post '/signin' do
  if User.authenticate(params[:username], params[:password]) != false
    flashlogger("/signin POST authentication passed")
    redirect '/'
  else
    flashlogger("/signin POST authentication failed")
    erb :signin
  end
end

get '/signin' do
  erb :signin
end
