10.times do
  fusername = (Faker::Name.first_name + Faker::Name.last_name).downcase
  femail = Faker::Internet.free_email
  user = User.create(username: fusername, email: femail, password: 'lol' )
  deck = Deck.find(rand(2) + 1)
  user.decks << deck
  user.save
end

