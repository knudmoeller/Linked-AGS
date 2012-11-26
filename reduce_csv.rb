#!/bin/ruby

# The source AGS file can have several successive entries for the same entity, from a higher to a lower administrative level.
# This script removes all but the lowest one. E.g.:
# 
# 40,41,01,0,01,,,"Flensburg, Stadt",,,,,,,,,,,,
# 50,50,01,0,01,0000,,"Flensburg, Stadt",,,,,,,,,,,,
# 60,61,01,0,01,0000,000,"Flensburg, Stadt",56.74,89357,44028,45329,1575,24937,"9,437509","54,78252",F02,Ostsee,01,Städtisch
# 
# will be reduced to 
# 
# 60,61,01,0,01,0000,000,"Flensburg, Stadt",56.74,89357,44028,45329,1575,24937,"9,437509","54,78252",F02,Ostsee,01,Städtisch


class Reducer
  
  attr_accessor :previous_name, :previous_line
  attr_accessor :source_file, :header_count
  
  def initialize(source_file_name, header_count)
    @source_file = File.open(source_file_name)
    @header_count = header_count.to_i
    @previous_name = ""
    
    skip_header()
  end
  
  def reduce_csv
    @source_file.each do |line|
      parts = line.split(",")
      name = parts[7]
      unless (name == @previous_name)
        puts @previous_line unless (@previous_name == "")
      end
      @previous_line = line
      @previous_name = name
    end
    @source_file
  end

  def skip_header
    (1..@header_count).each do |count|
      puts @source_file.readline
    end
  end
  
end

if (ARGV.count == 2)
  reducer = Reducer.new(ARGV[0], ARGV[1])
  reducer.reduce_csv
else
  puts "you need to specify source file and header count"
end
