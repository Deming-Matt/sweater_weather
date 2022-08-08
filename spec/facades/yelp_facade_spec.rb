require 'rails_helper'

RSpec.describe YelpFacade do
  location = "denver, co"
  term = "pizza"

  it 'creates Yelp search data' do
    results = YelpFacade.food_loc_search(location, term)

    expect(results).to be a(Yelp)
  end
end
