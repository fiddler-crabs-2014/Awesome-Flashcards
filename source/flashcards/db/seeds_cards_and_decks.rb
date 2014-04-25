Deck.transaction do

  deck = Deck.create(name: "Math Problems", genre: "Math")


  10.times do
    card = Card.new
    num1,num2 = rand(10)+1,rand(10)+1
    answer = num1 + num2
    card.question = "#{num1} + #{num2} = ?"
    card.answer = "#{answer}"
    card.difficulty_score = 1
    card.deck_id = deck.id
    card.save!
  end

  10.times do
    card = Card.new
    num1,num2 = rand(10)+1,rand(10)+1
    answer = num1 * num2
    card.question = "#{num1} x #{num2} = ?"
    card.answer = "#{answer}"
    card.difficulty_score = 2
    card.deck_id = deck.id
    card.save!
  end

  10.times do
    card = Card.new
    num1,num2,num3 = rand(10)+1,rand(10)+1,rand(30)+1
    answer = num1 * num2 * num3
    card.question = "#{num1} x #{num2} x #{num3}= ?"
    card.answer = "#{answer}"
    card.difficulty_score = 3
    card.deck_id = deck.id
    card.save!
  end

  deck = Deck.create(name: "State Capitals", genre: "Geography")
  File.readlines(APP_ROOT.join('db', 'statecapitals')).each do |line|
    card_data = line.split(",  ")
    Card.create(question: card_data.first.chomp, answer: card_data[1].chomp, difficulty_score: 1, deck_id: deck.id)
  end

end
