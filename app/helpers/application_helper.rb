# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def c(i)
    i+=1
   (i%2)+1
  end
end
