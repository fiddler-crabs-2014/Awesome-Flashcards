class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :decks, through: :rounds
  def authenticate(username, password)
    User.where(username: username, password: password)[0]
  end
end
