class User < ActiveRecord::Base
  # Remember to create a migration!

  def authenticate(username, password)
    User.where(username: username, password)[0]

  end
end
