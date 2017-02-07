class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :name, null: false, unique: true
      t.string :slug, null: false, unique: true
      t.text :description
      t.timestamps
    end
  end
end
