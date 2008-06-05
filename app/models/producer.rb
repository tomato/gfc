class Producer < ActiveRecord::Base
  has_many :producer_images, :order => "sequence"
end
