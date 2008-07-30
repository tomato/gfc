require 'image_helpers'

class Answer < ActiveRecord::Base
  include ImageHelpers
  
  belongs_to :producer
  has_one :image, :as => :section
  
  validates_associated :image
  validates_length_of :text, :minimum => 100
end
