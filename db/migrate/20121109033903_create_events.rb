class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :name
      t.text :details
      t.string :where
      t.date :when
      t.time :time
      t.string :source

      t.timestamps
    end
  end
end
