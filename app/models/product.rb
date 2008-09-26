class Product < ActiveRecord::Base
  include ImageHelpers
  
  belongs_to :producer
  has_one :image, :as => :section
end
