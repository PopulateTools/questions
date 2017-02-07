class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.references :question
      t.string :value, null: false
      t.integer :position
      t.timestamps
    end
  end
end
