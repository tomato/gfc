class Image < ActiveRecord::Base
  belongs_to :section , :polymorphic => true
  has_attachment  :content_type => :image ,
                  :storage => :file_system ,
                  :max_size => 1000.kilobytes , 
                  :resize_to => [240,160],
                  :path_prefix => 'public/images/producer'
  validates_as_attachment  

end
