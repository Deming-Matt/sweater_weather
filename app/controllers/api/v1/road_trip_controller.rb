class Api::V1::RoadTripController < ApplicationController

  def create
    if User.find_by(api_key: params[:api_key])
      latlng = MapquestFacade.latlng(params[:destination])
      forecast = OpenWeatherFacade.create_forecast_data(latlng)
      hourly = forecast.hourly_weather
      eta = MapquestFacade.eta(params[:origin], params[:destination])
      trip = { start_city: params[:origin], end_city: params[:destination], travel_time: eta, weather_at_eta: { temperature: hourly.first.temp, conditions: hourly.first.conditions }}
      render json: RoadTripSerializer.trip(trip)
    else
      render json: {error: "Incorrect key provided"}, status: 401
    end
  end

  private
    # def road_trip_params
    #   params.permit(:origin, :destination, :api_key)
    # end
end
