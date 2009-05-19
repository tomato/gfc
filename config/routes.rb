ActionController::Routing::Routes.draw do |map|

  map.resource :session
  map.resources :images, :users, :recipes, :baskets
  map.resources :deliveries, :member => { :set => :get }
  map.resources :producers do |producer|
    producer.resources :products do |product|
      product.resources :variants
    end
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.root :controller => "producers"
end
