class ChangeWhenTimeToWhenDateTime < ActiveRecord::Migration
  def up
    remove_column :events, :whentime
    add_column :events, :whendatetime, :datetime
  end

  def down
    add_column :events, :whentime, :time
    remove_column :events, :whendatetime
  end
end
