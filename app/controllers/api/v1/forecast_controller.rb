class Api::V1::ForecastController < ApplicationController

  def index
    location = MapquestFacade.latlon(forecast_params)
    forecast = OpenWeatherFacade.create_forecast_data(location)
    render json: ForecastSerializer.new(forecast)
  end

  private
    def forecast_params
      params.permit(:location)
    end
end
