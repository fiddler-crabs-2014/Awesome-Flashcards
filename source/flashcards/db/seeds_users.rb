10.times do
  fusername = (Faker::Name.first_name + Faker::Name.last_name).downcase
  femail = Faker::Internet.free_email
  User.create(username: fusername, email: femail, password: 'lol' )
end

