class Round < ActiveRecord::Base
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
    cards = Deck.find(self.deck_id).cards
    return cards.sample
  end

  def done?
    return self.guesses.count >= self.target_questions
  end

  def correct_count
    self.guesses.select(&:correct?).count
  end

end
