class Round < ActiveRecord::Base
  # Remember to create a migration!
  has_many :guesses
  has_one :deck
  belongs_to :user

  def score
    count_correct = 0
    self.guesses.each do |guess|
      if guess.answer == guess.card.answer
        count_correct += 1
      end
    end
    return count_correct.to_f / self.guesses.count.to_f
  end

  def get_next_card
    # puts self.deck_id
    # cards = Deck.where(id: self.deck_id).cards
    # return cards.sample
    # return self.deck.cards.sample
    return Card.all.sample

  end

  def done?
    return self.guesses.count >= self.target_questions
  end

  def correct_count
    # This could be optimzed by an SQL statement
    correct_count = 0

    self.guesses.each do |guess|
      correct_count += 1 if guess.correct?
    end

    return correct_count

  end

end
