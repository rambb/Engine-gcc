class CreateDeckItems < ActiveRecord::Migration
  def self.up
    create_table :deck_items do |t|
      t.integer :card_id
      t.integer :deck_id
      t.integer :quantity, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :deck_items
  end
end
