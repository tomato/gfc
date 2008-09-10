# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def flip_flop(i)
   "section#{(i%2)+1}"
  end

  def grid(i)
    "Cell#{i+1}"
  end

end
