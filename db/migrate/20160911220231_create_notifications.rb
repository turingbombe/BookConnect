class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :text
      t.belongs_to :club, foreign_key: true

      t.timestamps
    end
  end
end
