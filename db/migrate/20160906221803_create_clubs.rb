class CreateClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :status
      t.date :start_date
      t.date :end_date
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
