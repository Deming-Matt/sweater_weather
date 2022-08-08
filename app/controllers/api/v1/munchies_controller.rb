class Api::V1::MunchiesController < ApplicationController

  def index

    yelp = YelpFacade.food_loc_search(params[:location], params[:term])

    render json: MunchiesSerializer.new(yelp)
  end
end
