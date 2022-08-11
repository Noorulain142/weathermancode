# frozen_string_literal: true

# module gives file access
module Test
  def file_access_month(year, month)
    reqfile = []
    data = []
    cont = []
    files = Dir['weatherman_data/*']
    files.each do |filename|
      if filename.match(/#{year.to_i}/) && filename.match(/#{Date::ABBR_MONTHNAMES[month.to_i]}/)
        lines = File.readlines(filename)
        lines.each do |line|
          reqfile << line
        end
        reqfile.each do |i|
          data << i.split(',')
        end
      end
      data.each do |i|
        reqhash = {}
        reqhash['Date'] = i[0]
        reqhash['Max Temp'] = i[1]
        reqhash['Min Temp'] = i[3]
        reqhash['Max Humid'] = i[7]
        reqhash.compact
        cont << reqhash
      end
    end
    cont
  end

  def file_access_year(year)
    files = []
    data = []
    cont = []
    file = Dir['weatherman_data/*.txt']
    file.each do |filename|
      next unless File.read(filename).include?(year)

      lines = File.readlines(filename)
      lines.each do |line|
        files << line
      end
      files.each do |var|
        data << var.split(',')
      end
      data.each do |var|
        reqhash = {}
        reqhash['Date'] = var[0]
        reqhash['Max Temp'] = var[1]
        reqhash['Min Temp'] = var[3]
        reqhash['Max Humid'] = var[7]
        reqhash.compact
        cont << reqhash
      end
    end
    cont
  end
end
