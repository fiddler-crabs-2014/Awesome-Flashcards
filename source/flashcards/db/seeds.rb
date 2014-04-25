
require_relative 'seeds_cards_and_decks.rb'


10.times do
  fusername = Faker::Name.first_name + Faker::Name.last_name
  femail = Faker::Internet.free_email
  User.new(username: fusername, email: femail, password: 'lol' )
end

