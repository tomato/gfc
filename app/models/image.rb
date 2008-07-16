class Image < ActiveRecord::Base
  belongs_to :section , :polymorphic => true

  validates_format_of :content_type,
                      :with => /^image/,
                      :message => " You can only upload pictures "
  

  def uploaded_picture=(uploaded_image)
    self.content_type = uploaded_image.content_type.chomp
    self.data = uploaded_image.read
  end
end
