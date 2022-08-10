require 'rails_helper'

RSpec.describe YelpFacade do
  location = "denver, co"
  term = "pizza"

  it 'creates Yelp search data', :vcr do
    results = YelpFacade.food_loc_search(location, term)

    expect(results).to be_a(Yelp)
    expect(results.destination_city).to eq("Denver, CO")
  end
end
