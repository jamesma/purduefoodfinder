class AddWhenDateAndWhenTime < ActiveRecord::Migration
  def up
    add_column :events, :whendate, :date
    add_column :events, :whentime, :time
  end

  def down
    remove_column :events, :whendate
    remove_column :events, :whentime
  end
end
