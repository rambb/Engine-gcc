class ApplicationController < ActionController::Base
  before_filter :authorize #intercetta tutte le chiamate alle azioni . In pratica limito l'accesso solo agli amministratori a tutto il sito...
  protect_from_forgery
  
  private
  
#  def current_cart
#    Cart.find(session[:cart_id])
#  rescue ActiveRecord::RecordNotFound
#    cart = Cart.create
#    session[:cart_id] = cart.id
#    cart
#  end
    # ...
    protected
  def authorize
    unless User.find_by_id(session[:user_id])
    redirect_to login_url, :notice => "Please log in"
    end
  end
  
  
  def authorize_with_result
    #Rails.logger.info "hai sparato la cartuccia"
    if User.find_by_id(session[:user_id])
      #Rails.logger.info "ho trovato un cazzo"
      
      return true
    else
      redirect_to login_url, :notice => "Please log in"
      return false #Rails.logger.info "non ho trovato un cazzo"
    end
  end
end
