class UpdateGuesses < ActiveRecord::Migration
  def up

    add_column :guesses, :answer, :string
    remove_column :guesses, :result

  end

  def down

    remove_column :guesses, :answer
    add_column :guesses, :result, :boolean

  end
end
