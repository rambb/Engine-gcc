class Deck < ActiveRecord::Base
  has_many :deck_items, :dependent => :destroy
end
