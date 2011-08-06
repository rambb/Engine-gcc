class AddTitleToAbility < ActiveRecord::Migration
  def self.up
    add_column :abilities, :title, :string
  end

  def self.down
    remove_column :abilities, :title
  end
end
