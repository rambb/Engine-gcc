class CreateCollectionCards < ActiveRecord::Migration
  def self.up
    create_table :collection_cards do |t|
      t.integer :card_id
      t.integer :user_id
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :collection_cards
  end
end
