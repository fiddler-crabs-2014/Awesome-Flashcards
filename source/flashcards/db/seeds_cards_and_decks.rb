Deck.transaction do

  deck = Deck.create(name: "Math Problems", genre: "Math")
  card = Card.new

  10.times do
    num1,num2 = rand(10)+1,rand(10)+1
    answer = num1 + num2
    card.question = "#{num1} + #{num2} = ?"
    card.answer = "#{answer}"
    card.difficulty_score = 1
    card.deck_id = deck.id
    card.save
  end

  10.times do
    num1,num2 = rand(10)+1,rand(10)+1
    answer = num1 * num2
    card.question = "#{num1} x #{num2} = ?"
    card.answer = "#{answer}"
    card.difficulty_score = 2
    card.deck_id = deck.id
    card.save
  end

  10.times do
    num1,num2,num3 = rand(10)+1,rand(10)+1,rand(30)+1
    answer = num1 * num2
    card.question = "#{num1} x #{num2} x #{num3}= ?"
    card.answer = "#{answer}"
    card.difficulty_score = 3
    card.deck_id = deck.id
    card.save
  end

end
