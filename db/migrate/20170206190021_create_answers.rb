class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :question
      t.references :user
      t.integer :option_id
      t.string :text_answer
      t.timestamps
    end

    add_index :answers, [:user_id, :question_id], unique: true
  end
end
