class Guess < ActiveRecord::Base
  # Remember to create a migration!
  has_one :round
end
