# frozen_string_literal: true

require 'date'
require './file_access'
# Module for max,min avg temperature and humidity
module Month
  # TaskMonth generates the complete required data for a given moth of the year
  class TaskMonth
    include Test
    def maximum_tempavg(month)
      temp = []
      month.each do |var|
        temp << var['Max Temp'].to_i
      end
      temp.sum / temp.size
    end

    def minimum_tempavg(month)
      temp = []
      month.each do |var|
        temp << var['Min Temp'].to_i
      end
      temp.sum / temp.size
    end

    def avg_hum(month)
      temp = []
      month.each do |var|
        temp << var['Max Humid'].to_i
      end
      temp.sum / temp.size
    end
  end
end
