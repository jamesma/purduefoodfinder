class RemoveWhenDate < ActiveRecord::Migration
  def up
    remove_column :events, :whendate
  end

  def down
    add_column :events, :whendate, :date
  end
end
