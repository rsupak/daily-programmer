require 'forecast_io'

ForecastIO.configure do |config|
  config.api_key = '25d527f1bbf908496524aad9cdaedd8f'
end

# 27.9513384,-82.4595331
forecast = ForecastIO.forecast(27.951, -82.459, time: Time.new(2013, 3, 11).to_i)
puts forecast
