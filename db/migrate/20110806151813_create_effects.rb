class CreateEffects < ActiveRecord::Migration
  def self.up
    create_table :effects do |t|
      t.text :description
      t.text :routines

      t.timestamps
    end
  end

  def self.down
    drop_table :effects
  end
end
