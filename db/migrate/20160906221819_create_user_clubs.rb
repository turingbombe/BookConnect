class CreateUserClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :user_clubs do |t|
      t.references :user, foreign_key: true
      t.references :club, foreign_key: true

      t.timestamps
    end
  end
end
