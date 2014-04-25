require_relative 'seeds_round'
require_relative 'seeds_cards_and_decks.rb'
require_relative 'seeds_users'
deck = Deck.create(name: "Math Problems", genre: "Math")
card = Card.new
Deck.transaction do
end
