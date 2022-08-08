class MapquestFacade

  def self.latlng(search)
    json = MapquestService.location(search)
    result = json[:results][0][:locations][0][:latLng]

    Mapquest.new(result)
  end
end
