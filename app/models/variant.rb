class Variant < ActiveRecord::Base
  belongs_to :product

  validates_presence_of :description, :price
  validates_numericality_of :price
end
