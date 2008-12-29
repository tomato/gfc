# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  helper_method :can_edit?
  before_filter :get_basket

  private 
  def get_basket
    @basket = session[:basket] ||= Basket.new
  end
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery  :secret => 'c36eb9f87282c4f69ce511468e6446c5'
end
