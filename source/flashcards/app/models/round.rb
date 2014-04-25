class Round < ActiveRecord::Base
  # Remember to create a migration!
  has_many :guesses

  def score
    count_correct = 0
    self.guesses.each do |guess|
      if guess.answer == guess.card.answer
        count_correct += 1
      end
    end
    return count_correct.to_f / self.guesses.count.to_f
  end
end
