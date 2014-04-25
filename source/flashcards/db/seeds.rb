Deck.transaction do

  require_relative 'seeds_round'
  require_relative 'seeds_cards_and_decks.rb'

  deck = Deck.create(name: "Math Problems", genre: "Math")
  card = Card.new

  10.times do
    fusername = Faker::Name.first_name + Faker::Name.last_name
    femail = Faker::Internet.free_email
    User.new(username: fusername, email: femail, password: 'lol' )
  end

end
