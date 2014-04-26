class Guess < ActiveRecord::Base
  # Remember to create a migration!
    has_one :round
    belongs_to :card

    def correct?
      return self.answer == self.card.answer
    end
end
