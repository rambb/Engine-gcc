class Card < ActiveRecord::Base
  default_scope :order => 'name'
  has_many :deck_items
end
