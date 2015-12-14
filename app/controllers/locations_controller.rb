class LocationsController < ApplicationController
  def get_address
    lat = params[:latitude]
    lon = params[:longitude]
    @address = Geocoder.address("#{lat},#{lon}")
    respond_to do |format|
      format.js
    end
  end

  def search
    @user = current_user
    @posts =  Post.near(@user, params[:range])
    respond_to do |f|
      f.js
    end
  end
end
