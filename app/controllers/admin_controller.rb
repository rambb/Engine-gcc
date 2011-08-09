class AdminController < ApplicationController
  def index
    @total_users = User.count
    @total_cards = Card.count
  end

end
