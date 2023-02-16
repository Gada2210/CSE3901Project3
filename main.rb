# at least for replit \/
# first run 'bundle install'
# then run 'bundle exec ruby main.rb'

require "mechanize"
require "nokogiri"

agent = Mechanize.new
page = agent.get("https://news.osu.edu/").body

# content = page.read

# Create a new file to write to
fp = File.new("OSU News.txt", "w")

# Create an instance of Nokogiri to search page with CSS selectors
parsed_content = Nokogiri::HTML(page)


# Write header to output file
fp.write("OSU News Digest\n\n")

print "Working..."

# Search page using CSS selectors
PATH_FORMAT = Regexp.new("\/\/\*\/div\[1]\/div\[1]\/div\[\d\]\/div\/div\[3]\/div\[1]\/h3")

parsed_content.xpath("//h3").each do |headline|
    fp.write(headline.content, "\n")
end

#<h3 class="pp-block-item-heading">How sharing kindness helps ease anxiety and depression</h3>

