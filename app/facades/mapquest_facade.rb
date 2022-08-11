class MapquestFacade

  def self.latlng(search)
    json = MapquestService.location(search)
    result = json[:results][0][:locations][0][:latLng]
  end

  def self.eta(from, to)
    json = MapquestService.directions(from, to)
    result = json[:route][:formattedTime]
    time = result.split(':').map(&:to_i).inject(0) { |a, b| a * 60 + b }
    hours = time/3600
  end
end
