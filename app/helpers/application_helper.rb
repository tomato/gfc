# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def flip_flop(i)
   "section#{(i%2)+1}"
  end

  def grid(i)
    "Cell#{i+1}"
  end

  def login_label
    "<div class='login'>Hello #{current_user.login}</div>" if current_user 
  end

end
