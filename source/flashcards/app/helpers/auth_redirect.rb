def auth_redirect(redir = nil)

  if User.authenticate(params[:username], params[:password])
    @user = User.where(username: params[:username])[0]
    session[:user_id] = @user.id
    flashlogger("auth_redirect redir: #{redir}")
    redirect redir if redir != nil
  else
    flashlogger("auth_redirect failed auth redir /signin")
    redirect '/signin'
  end

end



