class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :decks, through: :rounds
  validates :email, uniqueness: true, presence: true

  def self.authenticate(username, password)
   if  User.where(username: username, password: password)[0]
    flashlogger("[LOG] User authenticated ")
    true
  else
    flashlogger("[LOG] User failed")
    false
  end
  end
end
