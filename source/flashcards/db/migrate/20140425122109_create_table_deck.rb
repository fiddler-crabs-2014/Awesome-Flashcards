class CreateTableDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.string :genre
      t.timestamps
    end
  end
end
