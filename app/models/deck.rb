class Deck < ActiveRecord::Base
  has_many :deck_items, :dependent => :destroy

  def add_card_to_deck(card_id)
    card_to_add = deck_items.find_by_card_id(card_id)
    if card_to_add
      card_to_add.quantity += 1
    else
      card_to_add = deck_items.build(:card_id => card_id)
    end
    card_to_add
  end
end
