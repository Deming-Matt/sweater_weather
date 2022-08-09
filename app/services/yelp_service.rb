class YelpService

  def self.conn
    Faraday.new(url: 'https://api.yelp.com')
  end

  def self.food_loc_search(loc, term)
    end_point = '/v3/businesses/search'
    response = conn.get(end_point) do |f|
      f.params['location'] = loc
      f.params['term'] = term
      f.headers['Authorization'] = ENV['yelp_key']
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
