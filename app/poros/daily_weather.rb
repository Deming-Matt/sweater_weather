class DailyWeather
  attr_reader :dt,
              :sunrise,
              :sunset,
              :min,
              :max,
              :conditions,
              :icon

  def initialize(data)
    @dt = Time.at(data[:dt]).to_datetime
    @sunrise = Time.at(data[:sunrise]).to_datetime
    @sunset = Time.at(data[:sunset]).to_datetime
    @min = data[:temp][:min]
    @max = data[:temp][:max]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end
