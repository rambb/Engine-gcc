class Card < ActiveRecord::Base
  default_scope :order => 'name'
  has_many :deck_items
  has_many :collection_cards

  before_destroy :ensure_not_referenced_by_any_deck_items_or_collection_cards

  private
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_deck_items_or_collection_cards

      if deck_items.empty? 
        return true
      else
        errors.add(:base, ' Deck items present')
        return false
      end

      if collection_cards.empty?
        return true
      else
        errors.add(:base, ' Collection cards present')
        return false
      end


    end
  

end
