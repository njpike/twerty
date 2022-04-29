class CreateTwerts < ActiveRecord::Migration[6.1]
  def change
    create_table :twerts do |t|
      t.references :user, foreign_key: true, null: false
      t.string :content, null: false, limit: 140
      t.references :parent_twert, foreign_key: { to_table: :twerts }

      t.timestamps
    end
  end
end
