class CreateBookClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :book_clubs do |t|
      t.integer :book_id
      t.integer :club_id

      t.timestamps
    end
  end
end
