class CreateTableCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question
      t.string :answer
      t.string :difficulty_score
      t.references :deck_id
      t.timestamps
    end
  end
end
