ActionController::Routing::Routes.draw do |map|

  map.resource :session
  map.resources :images, :users, :deliveries, :recipes
  map.resources :producers do |producer|
    producer.resources :products do |product|
      product.resources :variants
    end
  end

  map.root :controller => "producers"
end
