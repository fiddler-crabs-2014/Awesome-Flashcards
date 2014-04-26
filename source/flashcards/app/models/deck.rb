class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds
  has_and_belongs_to_many :users
end
