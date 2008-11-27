class Recipe < ActiveRecord::Base
  include ImageHelpers

  has_one :image, :as => :section
  validates_presence_of :name, :description
  validates_uniqueness_of :name
end
