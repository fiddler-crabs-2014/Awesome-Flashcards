class CreateDecksUsers < ActiveRecord::Migration
  def change
    create_table :decks_users do |t|
      t.belongs_to :user
      t.belongs_to :deck
    end
  end
end
