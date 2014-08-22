module RidesHelper
	def get_rides_tab_status(action, tab_string)
    case tab_string
      when 'index'
        return 'active' if ['index'].include?(action)
      when 'current_rides'
        return 'active' if ['current_rides'].include?(action)
      when 'past_rides'
        return 'active' if ['past_rides'].include?(action)
      when 'cancelled_rides'
        return 'active' if ['cancelled_rides'].include?(action)
    end
  end

  def get_rides_tabs_partial(action)
    case action
      when 'index'
        'current_rides_tab'
      when 'past_rides'
        'past_rides_tab'
      when 'cancelled_rides'
        'cancelled_rides_tab'
    end
  end

  def get_rides_partial(action)
    case action
      when 'index'
        "rides/current_rides_tab"
      when 'past_rides'
        "rides/past_rides_tab"
      when 'cancelled_rides'
        "rides/cancelled_rides_tab"
    end
  end
  
  # parse current date
  def current_date
    Time.now.strftime("%b %d, %Y")
  end

  # parse past date
  def past_date(date)
    date.strftime("%b %d, %Y") rescue 0
  end
  
  def get_taxi_info(taxi_info_id)
    @texi = TexiInfo.where(:id => taxi_info_id).first
  end
  
  # parse pickup date
  def current_rides_pickup_date(date)
    date.strftime("%A, %m/%d") rescue 0
  end
  
  # parse pickup date for edit current ride
  def edit_current_ride_pickup_date(date)
    date.strftime('%d/%m/%Y') rescue 0
  end
  
  # parse pickup_time
  def current_rides_pickup_time(time)
    time.strftime("%H:%M%p") rescue 0
  end
end
