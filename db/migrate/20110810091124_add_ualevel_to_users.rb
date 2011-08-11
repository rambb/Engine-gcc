class AddUalevelToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :ualevel, :integer, :default => 1
  end

  def self.down
    remove_column :users, :ualevel
  end
end
