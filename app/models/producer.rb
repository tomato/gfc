require 'image_helpers'

class Producer < ActiveRecord::Base
  include ImageHelpers
  
  has_many :producer_sections
  has_one :image, :as => :section
  
  validates_presence_of :name, :summary, :email, :tel, :address
  validates_uniqueness_of :name
  validates_associated :producer_sections, :image
  validates_format_of :email, :with => /[\w\-\.]+@[\w\-]+\.[a-z\.]{2,6}/
  validates_format_of :website, :with => /www\.\w+\.[\w\.]{2,6}/
  validates_length_of :summary, :in => 20..100
  validates_length_of :name, :in => 3..50

  def Producer.get(num)
    Producer.find(:all, :limit => num)
  end

end
