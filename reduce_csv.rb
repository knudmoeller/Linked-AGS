#!/bin/ruby

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
