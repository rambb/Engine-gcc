class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :special_powers
      t.string :abilities
      t.string :strength
      t.string :resistence
      t.string :cost
      t.integer :rarity_id
      t.integer :expansion_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cards
  end
end
