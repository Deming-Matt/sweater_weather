class YelpFacade

  def self.food_loc_search(loc, term)
    json = YelpService.food_loc_search(loc, term)
    result = json[:results]
    Yelp.new(result)
  end
end
