class Api::V1::RoadTripController < ApplicationController

  def create
    if User.find_by(api_key: params[:api_key])
      if (travel_time < 48)
        short_trip
      elsif (travel_time > 48)
        long_trip
      end
    else
      render json: {error: "Incorrect key provided"}, status: 401
    end
  end

  private
    # def road_trip_params
    #   params.permit(:origin, :destination, :api_key)
    # end
    def travel_time
      MapquestFacade.eta(params[:origin], params[:destination])
    end

    def short_trip
      weather = RoadTripFacade.destination_weather(params[:origin], params[:destination])
      eta = MapquestFacade.eta(params[:origin], params[:destination])
      trip = { start_city: params[:origin], end_city: params[:destination], travel_time: eta, weather_at_eta: { temperature: weather.temp, conditions: weather.conditions }}
      render json: RoadTripSerializer.trip(trip)
    end

    def long_trip
      weather = RoadTripFacade.destination_weather(params[:origin], params[:destination])
      eta = MapquestFacade.eta(params[:origin], params[:destination])
      trip = { start_city: params[:origin], end_city: params[:destination], travel_time: eta, weather_at_eta: { temperature: weather.max, conditions: weather.conditions }}
      render json: RoadTripSerializer.trip(trip)
    end
end
