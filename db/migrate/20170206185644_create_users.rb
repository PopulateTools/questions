class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :verification_token
      t.string :remember_digest
      t.inet :ip
      t.timestamps
    end
  end
end
