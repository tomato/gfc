require 'image_helpers'

class Producer < ActiveRecord::Base
  has_many :producer_sections
  has_one :image, :as => :section
  include ImageHelpers
  
  def Producer.get(num)
    Producer.find(:all, :limit => num)
  end

end
