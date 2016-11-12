require 'csv'

currency_pairs = %w(
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

currency_pairs.each do |currency_pair|
  dir = "/Users/takuhirofujikawa/Desktop/fx_hour_data/#{currency_pair.gsub('/', '-')}"
  Dir.mkdir(dir) rescue nil

  (0..23).each do |hour|
    total_perfomance = 100

    res = HourBar.select("currency_pair, CONVERT_TZ(time_utc,'UTC','Asia/Tokyo') time_jst, open_p, high_p, low_p, close_p").
      where(currency_pair: currency_pair).
      where("DATE_FORMAT(CONVERT_TZ(time_utc,'UTC','Asia/Tokyo'), '%H') = #{hour}").order(:time_utc)

    CSV.open("#{dir}/#{currency_pair.gsub('/', '-')}-hour#{hour}.csv",'w') do |csv|
      csv << [
        'currency_pair',
        'time_jst',
        'open_p',
        'high_p',
        'low_p',
        'close_p',
        'perfomance',
        'total_perfomance',
      ]

      res.each do |data|
        perfomance = (Math.log(BigDecimal.new(data[:close_p]) / BigDecimal.new(data[:open_p])) * 100).round(5)

        total_perfomance += BigDecimal.new(perfomance.to_s)

        csv << [
          data[:currency_pair],
          data[:time_jst].strftime("%Y-%m-%d %H"),
          data[:open_p],
          data[:high_p],
          data[:low_p],
          data[:close_p],
          perfomance,
          total_perfomance,
        ]
      end
    end
  end
end
