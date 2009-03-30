module DeliveriesHelper

  def next_available_delivery(time)
    if(time.hour < 14)
      time.advance(:days => 1).midnight
    else
      time.advance(:days => 2).midnight
    end
  end

  def next_delivery_days(time,num)
    (0..num-1).inject([]) do |product,days| 
      product << next_available_delivery(time).advance(:days => days)
    end
  end

  def daily_delivery_slots
    7..22
  end

end
