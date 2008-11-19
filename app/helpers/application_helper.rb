# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def flip_flop(i)
   "section#{(i%2)+1}"
  end

  def grid(i)
    "Cell#{i+1}"
  end

  def login_label
    if current_user
      "Hello #{current_user.login} #{link_to 'logout', session_url, :method => :delete}" 
    else
      link_to "Login", new_session_url
    end
  end

  def edit_link_to(*args)
    if can_edit? then link_to *args end
  end

end
