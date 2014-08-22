module HomeHelper
  def get_home_tab_status(action, tab_string)
    case tab_string
      when 'index'
        return 'active' if ['index'].include?(action)
      when 'pickup_and_dropoff'
        return 'active' if ['pickup_and_dropoff'].include?(action)
    end
  end

  def get_home_tabs_partial(action)
    case action
      when 'index'
        'view_home_map'
      when 'pickup_and_dropoff'
        'pickup_and_dropoff'
    end
  end

  def get_home_partial(action)
    case action
      when 'index'
        "home/view_home_map"
      when 'pickup_and_dropoff'
        "home/pickup_and_dropoff"
    end
  end
end
