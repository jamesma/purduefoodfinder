class RemoveWhenAndTimeFromEvent < ActiveRecord::Migration
  def up
    remove_column :events, :when
    remove_column :events, :time
  end

  def down
    add_column :events, :when, :date
    add_column :events, :time, :time
  end
end
