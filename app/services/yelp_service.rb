class YelpService

  def self.conn
    Faraday.new(url: 'https://api.yelp.com')
  end

  def self.food_loc_search(loc, term)
    end_point = '/v3/businesses/search'
    response = conn.get(end_point) do |f|
      f.params['location'] = loc
      f.params['term'] = term
      f.headers['Authorization'] = 'Bearer 9P-9u2FoznEgxBtM8C0PBm6VLELEJdbI8sxFYXEMVGEfQaH7biHFh54kooaH5UBJWa4SyZ2N3fZ-EzUetNZGnCtuJ9ytGTgIqq417OhaQqSBkcUukznUWL5k_ifxYnYx'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
