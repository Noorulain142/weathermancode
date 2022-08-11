# frozen_string_literal: true

require './year'
require './month'
require './barchart'
require_relative './file_access'
include Test

object = Yearfile::TaskYear.new
object1 = Month::TaskMonth.new
object2 = Bar2::TaskBarchart.new
# YEAR:
choice = ARGV[0]
year = ARGV[1]
month = ARGV[2]

case choice
when '-e'
  reqfile = Test.file_access_year(year)
  maxtemp = object.maximum_temp(reqfile)
  datemax = object.maximum_date(reqfile, maxtemp)
  puts "Highest: #{maxtemp} on #{datemax}"
  mintemp = object.minimum_temp(reqfile)
  datemin = object.minimum_date(reqfile, mintemp)
  if mintemp.zero?
    puts "lowest: #{mintemp} "
  else
    puts "lowest: #{mintemp} on #{datemin}"
  end
  maxhumid = object.maximum_hum(reqfile)
  datehumid = object.maximum_date_hum(reqfile, maxhumid)
  puts "Humid: #{maxhumid}% on #{datehumid}"
when '-a'
  file1 = Test.file_access_month(year, month)
  maxavgtemp = object1.maximum_tempavg(file1)
  minavgtemp = object1.minimum_tempavg(file1)
  avghumid = object1.avg_hum(file1)
  puts "Highest Average: #{maxavgtemp}C"
  puts "Lowest Average: #{minavgtemp}C"
  puts "Average Humidity:#{avghumid}%"
when '-c'
  file2 = Test.file_access_month(year, month)
  maxbartemp = object2.bar_max(file2)
  minbartemp = object2.bar_min(file2)
  combine = object2.bar_chart(maxbartemp, minbartemp)
  object2.bar(combine)
end
