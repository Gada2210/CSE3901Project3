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

puts "Working..."

# Write headlines and their links
parsed_content.xpath("//h3/a").each do |headline|
    fp.write(headline.content, "\n")
    fp.write(headline['href'], "\n")
end

# Alternative implementation that puts headlines and links in separate maps
# headlines = parsed_content.xpath('//h3/a').map { |headline| headline.content }
# links = parsed_content.xpath('//h3/a').map { |link| link['href'] }

# l1 = parsed_content.css('a.pp-block-item-container').map { |link| link['href'] }
# puts l1

# h1 = parsed_content.css('h3.pp-block-item-heading').map { |title| title.content}
# puts h1