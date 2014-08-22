class RidesController < ApplicationController
  before_filter :authenticate_user!
  
  # show current_ride 
	def index
    @rides = Booking.where(:user_id => current_user.id).where('pickup_time <= ? AND dropoff_time >= ?', Time.now,  Time.now).where(:pickup_datetime => Time.now.to_date).order('pickup_datetime ASC').first rescue 0

    if @rides.blank?
      @rides = Booking.where(:user_id => current_user.id).where(:pickup_datetime => Date.today..Date.today.next_month).order('pickup_datetime ASC').first rescue 0
    end
  	@pickup_address = PickupAddress.where(:booking_id => @rides.id).first unless @rides.blank?
  	@dropoff_address = DropoffAddress.where(:booking_id => @rides.id).first unless @rides.blank?
    @texi = TexiInfo.where(:id => @rides.taxi_info_id).first rescue 0
  	@hash = Gmaps4rails.build_markers(@pickup_address) do |user, marker|
		  marker.lat user.latitude
		  marker.lng user.longitude
		  marker.infowindow "PickUp Addr: "+@pickup_address.address
		  marker.picture({
		  	"url" => "assets/img/ico/map/ico_location_mark_a.png",
        "width" =>  36,
        "height" => 36
		  	})
		end
  	@hash1 = Gmaps4rails.build_markers(@dropoff_address) do |user, marker|
		  marker.lat user.latitude
		  marker.lng user.longitude
		  marker.infowindow "DropOff Addr: "+@dropoff_address.address
		  marker.picture({
		  	"url" => "assets/img/ico/map/ico_location_mark_b.png",
        "width" =>  36,
        "height" => 36
		  	})
		end
    
    @scheduled_rides = Booking.where(:user_id => current_user.id).where(:pickup_datetime => Date.tomorrow..Date.today.next_month).order('pickup_datetime ASC') rescue 0
    

    @all_current_rides = Booking.where(:user_id => current_user.id).where(:pickup_datetime => Date.today).order('pickup_datetime ASC') rescue 0
  end
  
  # show cancel ride 
	def cancelled_rides
    @scheduled_rides = Booking.where(:user_id => current_user.id).where(:pickup_datetime => Date.tomorrow..Date.today.next_month).order('pickup_datetime ASC') rescue 0
	end
  
  # delete current_ride on rides
  def destroy
    @rides = Booking.where(:user_id => current_user.id).where(:id => params[:id]).first rescue 0
    @rides.destroy unless @rides.blank?
    redirect_to rides_path, :notice => "Your booking has been deleted"
  end
  
  # show past_ride
	def past_rides
    if (params[:pickup_datetime].to_s!= "" && params[:return_pickup_datetime].to_s!= "")
      from_date = DateTime.parse(params[:pickup_datetime]).strftime("%Y-%m-%d") 
      to_date = DateTime.parse(params[:return_pickup_datetime]).strftime("%Y-%m-%d")
      @rides = Booking.where(:user_id => current_user.id).where(:pickup_datetime => from_date..to_date).where('pickup_datetime < ?', Time.now.to_date).paginate(:page => params[:page], :per_page => 10).order('pickup_datetime ASC')
      respond_to do |format|
        format.js
      end
    else
      @rides = Booking.where(:user_id => current_user.id).where('pickup_datetime < ?', Time.now.to_date).paginate(:page => params[:page], :per_page => 10).order('pickup_datetime ASC')
    end
    @scheduled_rides = Booking.where(:user_id => current_user.id).where(:pickup_datetime => Date.tomorrow..Date.today.next_month).order('pickup_datetime ASC') rescue 0
  end
end
