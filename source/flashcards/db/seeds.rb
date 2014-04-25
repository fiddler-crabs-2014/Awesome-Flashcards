deck = Deck.create(name: "Math Problems", genre: "Math")
card = Card.new

10.times do
  num1,num2 = rand(10),rand(10)
  answer = num1 + num2
  card.question = "#{num1} + #{num2} = ?"
  card.answer = "#{answer}"
  card.difficulty_score = 1
  card.deck = deck.id
  card.save
end
