class AddEffectToAbilities < ActiveRecord::Migration
  def self.up
    add_column :abilities, :effect, :text
    add_column :abilities, :effect_code, :text
    remove_column :abilities, :quantity
    remove_column :abilities, :target
    remove_column :abilities, :type_id
  end

  def self.down
    remove_column :abilities, :effect_code
    remove_column :abilities, :effect
    add_column :abilities, :quantity
    add_column :abilities, :target
    add_column :abilities, :type_id
  end
end
