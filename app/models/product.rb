class Product < ActiveRecord::Base
  include ImageHelpers
  
  belongs_to :producer
  has_one :image, :as => :section
  has_many :variants
  
  validates_presence_of :name, :description
end
