

def seed_rounds
  Round.delete_all
  Guess.delete_all

  cards = Card.all
  p cards

  10.times do
    round = Round.create(user_id: 1, deck_id: 1, target_questions: rand(10) + 10)
    round.target_questions.times do
      choose_card = cards.sample
      p choose_card
      p round.id
      p choose_card.id
      if rand(10) > 3
        answer = choose_card.answer
      else
        answer = "bad answer"
      end

      guess = Guess.create(round_id: round.id, card_id: choose_card.id, answer: answer )
    end

  end
end

seed_rounds
