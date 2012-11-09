class AddEventDateAndTime < ActiveRecord::Migration
  def up
    remove_column :events, :whendatetime
    add_column :events, :whendate, :date
    add_column :events, :whentime, :time
  end

  def down
    add_column :events, :whendatetime, :datetime
    remove_column :events, :whendate
    remove_column :events, :whentime
  end
end
