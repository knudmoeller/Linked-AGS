#!/bin/ruby

dbpedia_links_file = "output_data/dbpedia_links.nt"
geonames_file = "sources/dbpedia3.8/geonames_links.nt"

geonames_links = Hash.new

File.open(geonames_file).each_line do |line|
  parts = line.split(" ")
  dbpedia_resource = parts[0]
  geonames_links[dbpedia_resource] = line
end

File.open(dbpedia_links_file).each_line do |line|
  parts = line.split(" ")
  dbpedia_resource = parts[2]
  if (mapping = geonames_links[dbpedia_resource])
    puts mapping
  end
end