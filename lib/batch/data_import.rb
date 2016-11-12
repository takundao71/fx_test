require 'csv'

currrency_pairs = %w(
AUD/CAD GBP/AUD
AUD/JPY GBP/CAD
AUD/NZD GBP/JPY
AUD/USD GBP/NZD
CAD/JPY GBP/USD
EUR/AUD NZD/CAD
EUR/CAD NZD/JPY
EUR/GBP NZD/USD
EUR/JPY USD/CAD
EUR/NZD USD/JPY
EUR/USD
)

instances = []

currrency_pairs.each do |currency_pair|
  CSV.foreach("historical_data/#{currency_pair.gsub("/", "")}_UTC_Hourly_Bid_2007.01.01_2016.11.05.csv", headers: true) do |data|
    instances << HourBar.new(
      currency_pair: currency_pair,
      time_utc: data[0],
      open_p: data[1],
      high_p: data[2],
      low_p: data[3],
      close_p: data[4],
    )
  end
  HourBar.import instances
  pp "#{currency_pair} Finished"
  instances = []
end

