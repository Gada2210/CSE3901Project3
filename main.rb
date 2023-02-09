require "mechanize"
require "nokogiri"

agent = Mechanize.new
page = agent.get "https://news.osu.edu/"

puts "hello world!"