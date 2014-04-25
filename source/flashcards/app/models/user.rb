class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds

  def authenticate(username, password)
    User.where(username: username, password)[0]

  end
end
