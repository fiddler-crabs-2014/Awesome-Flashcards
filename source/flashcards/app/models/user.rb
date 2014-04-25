class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :decks, through: :rounds
  def self.authenticate(username, password)
   if  User.where(username: username, password: password)[0]
    # User.where(username: username, password: password)[0]
    puts("[LOG] User authenticated @login_failed = #{@login_failed}")
    true
  else
    puts("[LOG] User failed @login_failed = #{@login_failed}")
    false
  end
  end
end
