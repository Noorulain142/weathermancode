# frozen_string_literal: true

require 'date'
require 'colorize'
require './file_access'
# module gives the range for max,min temp for every day of month
module Bar2
  # TaskBarchart generates the complete barchart
  class TaskBarchart
    include Test
    def bar_max(file)
      temp = []
      file.each do |var|
        barr = {}
        barr[var['Date']] = var['Max Temp'].to_i
        temp.append(barr)
      end
      temp
    end

    def bar_min(file)
      temp = []
      file.each do |var|
        barr = {}
        barr[var['Date']] = var['Min Temp'].to_i
        temp.append(barr)
      end
      temp
    end

    def bar_chart(maxarray, minarray)
      maxarray.zip(minarray)
    end

    def bar(combine)
      combine.each do |i1, i2|
        i1.each do |key, val|
          next if key.include?('PKT') || key.include?("\n") || key.include?("\r") || key.include?('GST')

          puts "#{key} " + " #{'+' * 20}".blue + " #{val}C"
          i2.each do |key1, value|
            next if key1.include?('PKT') || key1.include?("\n") || key1.include?("\r") || key1.include?('GST')

            puts "#{key1} " + " #{'+' * 10}".red + " #{value}C"
          end
        end
      end
    end
  end
end
