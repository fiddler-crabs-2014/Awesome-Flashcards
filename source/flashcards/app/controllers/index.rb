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
end

post '/signin' do
  if User.authenticate(params[:username], params[:password]) != false
    puts("[LOG] Signin POST worked") if FLASHDEBUG
    redirect '/'
  else
    puts("[LOG] Signin POST login_failed")  if FLASHDEBUG
    erb :signin
  end
end

get '/signin' do
  erb :signin
end
