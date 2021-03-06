class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest
      t.string :firstname
      t.string :lastname
      t.string :email

      t.timestamps
    end
  end
end
