

def seed_rounds
  Round.delete_all

  10.times do
    round = Round.create(user_id: 1, deck_id: 1, target_questions: rand(10) + 10)
    round.target_questions.times do
      result = rand(10) > 3
      guess = Guess.create(round_id: round.id, card_id: 1, result: result )
    end

  end
end

seed_rounds
