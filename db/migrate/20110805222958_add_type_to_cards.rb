class AddTypeToCards < ActiveRecord::Migration
  def self.up
    add_column :cards, :type_id, :integer
  end

  def self.down
    remove_column :cards, :type_id
  end
end
