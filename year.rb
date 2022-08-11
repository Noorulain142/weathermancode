# frozen_string_literal: true

require 'date'
require './file_access'

# Module for max,min temperature and humidityrubov
module Yearfile
  # TaskYear generates the complete required data for the year
  class TaskYear
    include Test
    def maximum_temp(year)
      temp = []
      year.each do |var|
        temp << var['Max Temp'].to_i
      end
      temp.max
    end

    def maximum_date(maxtemp, date)
      data_max_date = []
      maxtemp.each do |var|
        data_max_date << var['Date'] if var['Max Temp'].to_i == date
      end
      data_max_date[0]
    end

    def minimum_temp(year)
      temp = []
      year.each do |var|
        temp << var['Min Temp'].to_i
      end
      temp.min
    end

    def minimum_date(mintemp, date)
      data_min_date = []
      mintemp.each do |var|
        data_min_date << var['Date'] if var['Min Temp'].to_i == date
      end
      data_min_date[0]
    end

    def maximum_hum(year)
      temp = []
      year.each do |var|
        temp << var['Max Humid'].to_i
      end
      temp.max
    end

    def maximum_date_hum(maxhumid, date)
      data_humidmax_date = []
      maxhumid.each do |var|
        data_humidmax_date << var['Date'] if var['Max Humid'].to_i == date
      end
      data_humidmax_date[0]
    end
  end
end
