# at least for replit \/
# first run 'bundle install'
# then run 'bundle exec ruby main.rb'

require "mechanize"
require "nokogiri"
require "mail"

# Set up email configuration
Mail.defaults do
  delivery_method :smtp, address: "smtp.sendgrid.net", port: 587,
    user_name: "apikey", password: "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",
    enable_ssl: true
end

# Create a new Mechanize agent and get the page content
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

# Read the contents of the file into a variable
file_contents = File.read("OSU News.txt")

# Define email content
email_body = "Good morning! Here are the latest news headlines from OSU:\n\n#{file_contents}"

# Send email with results
Mail.deliver do
  from    "gautamagarwal22@gmail.com"
  to      "gaa05092001@gmail.com"
  subject "OSU News Digest - #{Time.now.strftime('%m/%d/%Y')}"
  body    email_body
end

#<h3 class="pp-block-item-heading">How sharing kindness helps ease anxiety and depression</h3>

