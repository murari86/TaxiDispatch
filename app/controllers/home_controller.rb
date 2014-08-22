class HomeController < ApplicationController
  def index
    if params[:hash] != nil
      @hash = params[:hash]
    else
    	@texi_info = TexiInfo.all
      @hash = Gmaps4rails.build_markers(@texi_info) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.picture({
          "url" => "assets/img/ico/map/ico_location_mark.png",
          "width" =>  36,
          "height" => 36
          })
      end
    end
  end
  
  def help
  end
  
  # sending email
  def email_us
    render :layout => false
  end
  
  # show nearest texi for booking on home map within range
  def nearest_texi
    if params[:pick_up_id] != nil
      @texi_info = TexiInfo.near(params[:pick_up_id],4)
    else
      @texi_info = TexiInfo.all
    end
    @hash = Gmaps4rails.build_markers(@texi_info) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.address
      marker.picture({
        "url" => "assets/img/ico/map/ico_location_mark.png",
        "width" =>  36,
        "height" => 36
        })
    end
    respond_to do |format|
      format.js
    end
  end
end
