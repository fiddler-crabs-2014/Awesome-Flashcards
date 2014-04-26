class Deck < ActiveRecord::Base
  has_many :cards
  has_many :round
end
